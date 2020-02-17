class RemoveColumns < ActiveRecord::Migration[6.0]
  def change
    change_table :themes do |t|
      t.remove :created_at
      t.remove :updated_at
    end
  end

  def change
    change_table :articles_themes do |t|
      t.remove :created_at
      t.remove :updated_at
    end
  end
end
