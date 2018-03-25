class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients, inverse_of: :recipe,  dependent: :destroy
  has_many :directions, inverse_of: :recipe, dependent: :destroy

  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true

  scope :search, -> (argument) { Recipe.includes(:ingredient).where("ingredient ILIKE :search or title ILIKE :search", search: "%#{argument}%").references(:ingredient)}

  def self.search(search)
    Recipe.where("title ILIKE ?", "%#{search}%")
    Recipe.joins(:ingredients).where("name ILIKE ?", "%#{search}%")
  end
end
