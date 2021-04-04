class Prototype < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments
  validates :image,:title,:catch_copy,:consept ,presence: true
end
