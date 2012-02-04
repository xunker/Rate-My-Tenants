class Tenant < ActiveRecord::Base
	belongs_to :property

  validates_presence_of :first_name
  validates_presence_of :last_name

  def last_name
    [first_name, last_name].join(' ').strip
  end
end
