class CreateTenants < ActiveRecord::Migration
  def self.up
    create_table :tenants do |t|
    	t.string :first_name, :null => false
    	t.string :last_name, :null => false
    	t.string :ssn_last_fours
      t.timestamps
    end
  end

  def self.down
    drop_table :tenants
  end
end
