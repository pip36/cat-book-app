class AddIndexesToLikes < ActiveRecord::Migration[5.0]
  def change
    add_index :likes, :user_id
    add_index :likes, :liked_id
    add_index :likes, [:user_id, :liked_id], unique: true
  end
end
