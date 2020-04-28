class AddCategoryIdToArticle < ActiveRecord::Migration[6.0]
  def change
    change_table :articles do |t|
      t.belongs_to :category
    end
  end
end
