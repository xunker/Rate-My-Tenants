class CreateRatings < ActiveRecord::Migration
  def self.up
    create_table :ratings do |t|
    	t.integer :property_id, :null => false

      t.string :first_name, :null => false
      t.string :last_name, :null => false

    	t.integer :rental_start_month
      t.integer :rental_start_year
    	t.integer :rental_end_month
      t.integer :rental_end_year

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
