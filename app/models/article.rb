class Article < ApplicationRecord
    has_and_belongs_to_many :themes
    has_many :words, through: :themes
    has_one_attached :image
    validates :title, presence: true, uniqueness: true
    validates :content, presence: true
    validates :author, presence: true
end
