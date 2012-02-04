class Tenant < ActiveRecord::Base
  belongs_to :user
	has_one :rating
  accepts_nested_attributes_for :rating
	belongs_to :property
  accepts_nested_attributes_for :property

	has_many :users, :through => :ratings

	has_many :addresses
	has_many :telephone_numbers
	has_many :id_card_numbers
end
