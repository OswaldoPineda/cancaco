class Sale < ApplicationRecord
  validates :title, :description, :extra_info, :quantity, :price, presence: true
  belongs_to :category
  belongs_to :company
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
end
