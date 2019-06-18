class Category < ApplicationRecord
  has_many :subcategories, dependent: :destroy
  validates :title, presence: true
end
