class Ingredient < ApplicationRecord
  belongs_to :recipe, inverse_of: :ingredients
  # belongs_to :user
end
