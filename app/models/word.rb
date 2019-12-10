class Word < ApplicationRecord
    validates :name,  presence: true, uniqueness: true
    validates :translation, presence: true

    def self.start_with(query)
        Word.where("name LIKE :prefix", prefix: "#{query}%")
    end
end
