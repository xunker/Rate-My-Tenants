class ReviewsController < ApplicationController
	before_filter :login_required, :only => [ :edit, :update ]

	def create
	end

	# ajax
	def zip_to_city
		zip = params["code"]
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
