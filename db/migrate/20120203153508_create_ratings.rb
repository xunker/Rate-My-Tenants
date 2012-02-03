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

    	# official questions
    	t.boolean :pay_on_time, :null => false, :default => true
    	t.boolean :pets, :null => false, :default => false
    	t.boolean :followed_rules, :null => false, :default => true
    	t.boolean :gave_proper_notice, :null => false, :default => true
    	t.boolean :leave_on_time, :null => false, :default => true
    	t.boolean :owe_money, :null => false, :default => true

    	# our questions -- null is abstain
    	t.integer :overall_rating, :null => true
    	t.boolean :deposits_returned, :null => true
    	t.boolean :smoking, :null => true
    	t.boolean :evicted, :null => true


      t.timestamps
    end
  end

  def self.down
    drop_table :ratings
  end
end
