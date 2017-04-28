class AddInfoToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :firstname, :string
    add_column :users, :surname, :string
    add_column :users, :birthday, :date
    add_column :users, :sex, :string
  end
end
