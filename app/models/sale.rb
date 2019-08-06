class Sale < ApplicationRecord
  validates :title, :description, :extra_info, :quantity, :price, presence: true
  belongs_to :category
  belongs_to :company
end
