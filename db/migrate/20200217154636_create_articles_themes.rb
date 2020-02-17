class CreateArticlesThemes < ActiveRecord::Migration[6.0]
  def change
    create_table :articles_themes do |t|
      t.belongs_to :article
      t.belongs_to :theme
      t.timestamps
    end
  end
end
