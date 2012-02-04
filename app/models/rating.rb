class Rating < ActiveRecord::Base
	belongs_to :user
	belongs_to :tenant
	belongs_to :property

  validates_presence_of :user_id
  validates_presence_of :tenant_id
  validates_presence_of :property_id

  # t.integer :rental_start_month
  # t.integer :rental_start_year
  # t.integer :rental_end_month
  # t.integer :rental_end_year

  validates_presence_of :times_late_paying
  validates_presence_of :noise_complaints
  validates_presence_of :damage
  validates_presence_of :skipped_or_evicted
  validates_presence_of :left_owing_money

end
