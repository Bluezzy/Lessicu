class Word < ApplicationRecord
    belongs_to :theme
    validates :name,  presence: true, uniqueness: true
    validates :translation, presence: true
    validates :theme_id, presence: true

    def self.start_with(query)
        Word.where("name LIKE :prefix", prefix: "#{query}%")
    end
end
