class Property < ActiveRecord::Base
	belongs_to :user

  has_many :ratings
  accepts_nested_attributes_for :ratings

  validates_presence_of :zip
  validates_presence_of :name
end
