class Tenant < ActiveRecord::Base
	has_many :ratings
	has_many :properties, :through => :ratings
	has_many :users, :through => :ratings

	has_many :addresses
	has_many :telephone_numbers
	has_many :id_card_numbers
end
