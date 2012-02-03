class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
    	t.integer :from_user_id, :null => false
    	t.integer :to_user_id, :null => false
			t.integer :review_id, :null => false
			t.integer :message_id # reply to another message?
			t.text :body, :null => false
      t.datetime :read_at, :null => true
      t.timestamps
    end

    add_index :messages, [:from_user_id]
    add_index :messages, [:to_user_id]
  end

  def self.down
    drop_table :messages
  end
end
