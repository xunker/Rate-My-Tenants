class CreateTelephoneNumbers < ActiveRecord::Migration
  def self.up
    create_table :telephone_numbers do |t|
    	t.integer :tenant_id, :null => false
    	t.string :number, :null => false
      t.timestamps
    end

    add_index :telephone_numbers, :tenant_id
    add_index :telephone_numbers, :number
  end

  def self.down
    drop_table :telephone_numbers
  end
end
