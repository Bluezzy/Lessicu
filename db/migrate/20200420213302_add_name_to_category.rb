class AddNameToCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :name, :string
    add_column :categories, :string, :string
  end
end
