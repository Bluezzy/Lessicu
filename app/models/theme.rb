class Theme < ApplicationRecord
  has_many :words
  has_and_belongs_to_many :articles

  def self.get_id(theme_name)
    Theme.find_by(name: theme_name).id
  end
end
