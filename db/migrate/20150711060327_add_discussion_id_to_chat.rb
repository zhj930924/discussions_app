class AddDiscussionIdToChat < ActiveRecord::Migration
  def change
    add_column :chats, :discussion_id, :integer

    add_index :chats, :discussion_id
  end
end
