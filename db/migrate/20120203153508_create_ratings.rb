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
      t.string :times_late_paying, :null => false
      t.string :noise_complaints, :null => false
      t.string :damage, :null => false
      t.boolean :skipped_or_evicted, :null => false, :default => false
      t.string :left_owing_money, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :ratings
  end
end
