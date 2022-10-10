class Photo < ApplicationRecord
  # Validates
  validates :title, presence: true, uniqueness: true
  # validates :image, presence: true

  # Associations
  belongs_to :category, counter_cache: true
  has_many :comments, as: :commentable, dependent: :destroy
  has_one_attached :image
end
