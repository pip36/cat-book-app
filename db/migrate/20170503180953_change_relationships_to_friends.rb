class ChangeRelationshipsToFriends < ActiveRecord::Migration[5.0]
  def change
    rename_table :relationships, :friendships
  end
end
