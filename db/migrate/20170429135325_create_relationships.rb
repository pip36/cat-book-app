class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.integer :from_id
      t.integer :to_id
      t.integer :type

      t.timestamps
    end
    add_index :relationships, :from_id
    add_index :relationships, :to_id
    add_index :relationships, [:from_id, :to_id], unique: true
  end
end
