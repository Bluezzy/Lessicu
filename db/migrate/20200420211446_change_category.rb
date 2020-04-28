class ChangeCategory < ActiveRecord::Migration[6.0]
  def change
    def change
      change_table :category do |t|
        t.remove :timestamps
        t.string :name
      end

      change_table :article do |t|
        t.belongs_to :category
      end
    end
  end
end
