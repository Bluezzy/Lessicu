class ChangeWords < ActiveRecord::Migration[6.0]
  def change
    change_table :words do |t|
      t.remove :category
      t.belongs_to :theme
    end
  end
end
