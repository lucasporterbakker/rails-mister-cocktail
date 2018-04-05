class Cocktail < ApplicationRecord
  validates :name, uniqueness: true, presence: true

  has_many :ingredients, through: :doses
  has_many :doses
end
