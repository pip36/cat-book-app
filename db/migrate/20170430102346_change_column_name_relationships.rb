class ChangeColumnNameRelationships < ActiveRecord::Migration[5.0]
  def change
    rename_column :relationships, :type, :relationship_type
  end
end
