class Cocktail < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  mount_uploader :photo, PhotoUploader
  has_many :reviews

  def self.search(query)
    Cocktail.where("name ILIKE ?", "%#{query}%") 
  end
end
