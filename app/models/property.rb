class Property < ActiveRecord::Base
	belongs_to :user

  has_many :ratings
  accepts_nested_attributes_for :ratings

  has_many :tenants
  accepts_nested_attributes_for :tenants

  validates_presence_of :zip
  validates_presence_of :name
end
