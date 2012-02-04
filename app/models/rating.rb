class Rating < ActiveRecord::Base
	belongs_to :property

  # t.integer :rental_start_month
  # t.integer :rental_start_year
  # t.integer :rental_end_month
  # t.integer :rental_end_year

  validates_presence_of :times_late_paying
  validates_presence_of :noise_complaints
  validates_presence_of :damage
  validates_inclusion_of :skipped_or_evicted, :in => [true, false]
  validates_presence_of :left_owing_money

  validates_presence_of :first_name
  validates_presence_of :last_name

  validates_presence_of :accepted_terms

  named_scope :newest_first, :order => "id DESC"

  def name
    [first_name, last_name].join(' ').strip
  end
end
