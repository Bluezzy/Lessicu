class Word < ApplicationRecord
    paginates_per 250
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

    def self.update_dependent_words_after_deleted_theme(deleted_theme_id)
        other_theme_id = Theme.find_by(name: "autre").id
        Word.where(theme_id: deleted_theme_id).update_all(theme_id: other_theme_id)
    end
end
