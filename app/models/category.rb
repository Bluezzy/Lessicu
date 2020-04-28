class Category < ApplicationRecord
    has_many :articles

    def self.get_id(category_name)
        Category.find_by(name: category_name).id
    end
end
