class ChangeArticle < ActiveRecord::Migration[6.0]
  def change
    change_table :articles do |t|
      t.remove :category
    end
  end
end
