class CreateProperties < ActiveRecord::Migration
  def self.up
    create_table :properties do |t|
    	t.integer :user_id, :null => false
    	t.string :name, :null => false
    	t.string :zip
      t.string :city
      t.string :state, :size => 2
      t.timestamps
    end

    add_index :properties, :user_id
    add_index :properties, [:user_id, :name], :unique => true
    add_index :properties, :zip
    add_index :properties, :state
  end

  def self.down
    drop_table :properties
  end
end
