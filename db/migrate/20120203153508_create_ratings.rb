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

      t.string :pay_on_time # yes, no, sometimes, N/A (as null/blank)
      t.string :follow_rules # Did they violate lease provisions/house rules?
      t.string :owe_money # Did they owe you any money when they left?
      t.string :leave_on_time # Did they leave on time?
      t.string :pets # Did they have pets?
      t.string :smoke # Did they smoke?

      t.timestamps
    end
  end

  def self.down
    drop_table :ratings
  end
end
