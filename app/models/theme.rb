class Theme < ApplicationRecord
  has_many :words
  has_and_belongs_to_many :articles
end
