class UsersController < ApplicationController
  before_filter :login_required, :except => [ :new, :create ]

  def index
    @user = current_user
  end

  def show
    redirect_to :action => 'index'
  end

  def update
    @user = current_user
    if !params[:current_password].blank?
      if @user.encrypt(params[:current_password]) != @user.crypted_password
        @user.errors.add(:password, 'Current password is not correct')
      end
    end
    # require 'ruby-debug'; debugger
    unless @user.errors.present?
      @user.update_attributes(params[:user])
      flash[:notice] = 'Account updated' unless @user.errors.present?
    end

    render :action => 'index'
  end


  # render new.rhtml
  def new
    @user = User.new(:first_name => '', :last_name => '')
  end

  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end
end
