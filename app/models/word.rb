class Word < ApplicationRecord
    validates :name,  presence: true, uniqueness: true
    validates :translation, presence: true
end
