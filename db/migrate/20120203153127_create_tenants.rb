class CreateTenants < ActiveRecord::Migration
  def self.up
    create_table :tenants do |t|
    	t.string :first_name, :null => false
    	t.string :last_name, :null => false
    	t.integer :property_id, :null => false
      t.timestamps
    end

    add_index :tenants, :property_id
  end

  def self.down
    drop_table :tenants
  end
end
