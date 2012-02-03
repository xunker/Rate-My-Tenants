class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
    	t.integer :tenant_id, :null => false
    	t.string :address_1, :null => false
    	t.string :address_2
    	t.string :city, :null => false
    	t.string :state, :size => 2, :null => false
    	t.string :postal, :size => 6, :null => false # postal not zip to think about moving to canada
    	t.string :country, :default => 'United States of America'
      t.timestamps
    end

    add_index :addresses, :tenant_id
    add_index :addresses, [:address_1, :state]
  end

  def self.down
    drop_table :addresses
  end
end
