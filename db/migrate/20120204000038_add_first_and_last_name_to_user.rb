class AddFirstAndLastNameToUser < ActiveRecord::Migration
  def self.up
  	add_column :users, :first_name, :string, :null => 'false', :default => 'unknown'
  	add_column :users, :last_name, :string, :null => 'false', :default => 'unknown'
  end

  def self.down
  	remove_column :users, :first_name
  	remove_column :users, :last_name
  end
end