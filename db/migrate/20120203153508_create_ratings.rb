class CreateRatings < ActiveRecord::Migration
  def self.up
    create_table :ratings do |t|
    	t.integer :user_id, :null => false
    	t.integer :tenant_id, :null => false
    	t.integer :property_id, :null => false

    	t.integer :rental_start_month
      t.integer :rental_start_year
    	t.integer :rental_end_month
      t.integer :rental_end_year

      t.integer :rent_amount
      t.integer :times_late_paying, :null => false, :default => 0
      t.integer :noise_complaints, :null => false, :default => 0
      t.boolean :notice_gave, :null => false, :default => true
      t.boolean :left_on_time, :null => false, :default => true
      t.boolean :lease_fulfilled, :null => false, :default => true
      t.boolean :pets, :null => false, :default => false
      t.boolean :pet_damage, :null => false, :default => false
      t.boolean :evicted, :null => false, :default => false
      t.boolean :skipped, :null => false, :default => false
      t.boolean :would_rent_again, :null => false, :default => true

      t.integer :amount_owing, :default => 0
      t.string :reason_for_owing # damages, rent, late charges

      t.text :comments


      t.timestamps
    end
  end

  def self.down
    drop_table :ratings
  end
end
