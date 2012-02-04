class PropertiesController < ApplicationController
  before_filter :login_required

  def index
    redirect_to users_path+"#properties"
  end

  def show
    redirect_to edit_property_path(Property.find_by_id(params[:id]))
  end

  def update
    @property = Property.find_by_id_and_user_id(params[:id], current_user.id)
  end

  def edit
    @property = Property.find_by_id_and_user_id(params[:id], current_user.id)
  end

  def destroy
    @property = Property.find_by_id_and_user_id(params[:id], current_user.id)
    if @property.ratings.empty?
      @property.destroy
      redirect_to users_path+"#properties"
    else
      flash[:error] = "That property has ratings on it.  Please delete those ratings first before deleting the property."
      redirect_to users_path
    end
  end
end
