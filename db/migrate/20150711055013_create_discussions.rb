class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :title
      t.text :description
      t.string :secret_key, default: nil
      t.integer :user_id
      t.integer :published, default: 0
      t.text :slug

      t.timestamps
    end

  end
end
