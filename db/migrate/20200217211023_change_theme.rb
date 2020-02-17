class ChangeTheme < ActiveRecord::Migration[6.0]
  def change
    change_table :themes do |t|
      t.remove :created_at
    end
  end
end
