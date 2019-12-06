class Article < ApplicationRecord
    has_many :words
    validates :title, presence: true, uniqueness: true
    validates :content, presence: true
    validates :author, presence: true
end
