class CreateProperties < ActiveRecord::Migration
  def self.up
    create_table :properties do |t|
    	t.integer :user_id, :null => false
    	t.string :name, :null => false
    	t.string :zip
      t.timestamps
    end

    add_index :properties, :user_id
    add_index :properties, [:user_id, :name], :unique => true
  end

  def self.down
    drop_table :properties
  end
end
