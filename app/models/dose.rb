class Dose < ApplicationRecord

  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, allow_blank: false, presence: true
  validates :ingredient, uniqueness: { scope: :cocktail }

end
