class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients, inverse_of: :recipe,  dependent: :destroy
  has_many :directions, inverse_of: :recipe, dependent: :destroy
  mount_uploader :image, ImageUploader
  validates :title, presence: true
  validates :description, presence: true
  validates :video, presence: true
  validates :image, presence: true
  # YT_LINK_FORMAT = /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i
  # validates :video, presence: true, format: YT_LINK_FORMAT
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true

  scope :search, -> (argument) { Recipe.includes(:ingredient).where("ingredient ILIKE :search or title ILIKE :search", search: "%#{argument}%").references(:ingredient)}

  def self.search(search)
    Recipe.where("title ILIKE ?", "%#{search}%")
    Recipe.joins(:ingredients).where("name ILIKE ?", "%#{search}%")
  end
end
