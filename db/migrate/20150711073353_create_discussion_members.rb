class CreateDiscussionMembers < ActiveRecord::Migration
  def change
    create_table :discussion_members do |t|
      t.integer :user_id
      t.integer :discussion_id
      t.string :access

      t.timestamps
    end
  end
end
