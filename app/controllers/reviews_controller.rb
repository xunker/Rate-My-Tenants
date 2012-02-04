class ReviewsController < ApplicationController
	before_filter :login_required

  # def new
  #   @rating = Rating.new
  # end

	def create
   @property = Property.create(params['property'].merge(:user_id => current_user.id))
   render :text => @property.errors.full_messages.to_sentence
	end

	# ajax
	def zip_to_city
		zip = params["zip"]
		if zip.present?
			if zip.length != 5
				render :layout => false, :text => "incorrect ZIP"
			else
				geo = GeoKit::Geocoders::MultiGeocoder.multi_geocoder(zip)
				if geo.success
					render :layout => false, :text => [geo.city, geo.state].join(', ')
				else
					render :layout => false, :text => 'unknown ZIP'
				end
			end
		else
			render :layout => false, :nothing => true
		end
	end
end
