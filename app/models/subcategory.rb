class Subcategory < ApplicationRecord
  belongs_to :category, dependent: :destroy
  validates :title, presence: true, uniqueness: true
end
