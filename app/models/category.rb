class Category < ApplicationRecord
    has_many :articles
    validates :name,  presence: true, uniqueness: true

    def self.get_id(category_name)
        Category.find_by(name: category_name).id
    end
end
