class CreateProperties < ActiveRecord::Migration
  def self.up
    create_table :properties do |t|
    	t.integer :user_id, :null => false
    	t.string :name, :null => false
    	t.string :code # so this is, like, zip code now.  Blarg, Im tired.
    	t.string :address
      t.timestamps
    end

    add_index :properties, :user_id
    add_index :properties, [:user_id, :name], :unique => true
    add_index :properties, [:user_id, :code], :unique => true
  end

  def self.down
    drop_table :properties
  end
end
