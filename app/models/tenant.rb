class Tenant < ActiveRecord::Base
	belongs_to :property

  validates_presence_of :first_name
  validates_presence_of :last_name
end
