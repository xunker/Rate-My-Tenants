class CreateIdCardNumbers < ActiveRecord::Migration
  def self.up
    create_table :id_card_numbers do |t|
    	t.integer :tenant_id, :null => false
    	t.string :state, :size => 2, :null => false
    	t.string :type, :null => false # driver lisence, state ID, etc
    	t.string :number, :null => false
      t.timestamps
    end

    add_index :id_card_numbers, :tenant_id
    add_index :id_card_numbers, [:tenant_id, :state, :type, :number], :unique => true, :name => "tid_state_type_number"

  end

  def self.down
    drop_table :id_card_numbers
  end
end
