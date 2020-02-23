class Word < ApplicationRecord
    belongs_to :theme
    validates :name,  presence: true, uniqueness: true
    validates :translation, presence: true, uniqueness: true
    validates :theme_id, presence: true

    def self.start_with(query, language)
        if language === 'français'
            Word.where("name LIKE :prefix", prefix: "#{query}%")
        elsif language === 'corsu'
            Word.where("translation LIKE :prefix", prefix: "#{query}%")
        end
    end
end
