class Change < ActiveRecord::Migration[5.0]
  def change
    remove_column :friendships, :relationship_type
    add_column :friendships, :accepted, :boolean
  end
end
