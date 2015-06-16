class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.text :message
      t.integer :user_id
      t.integer :channel_id

      t.timestamps
    end
  end
end
