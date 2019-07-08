class Petition < ApplicationRecord
  validates :title, :description, :quantity, :deadline, :active, presence: true
  belongs_to :category
  belongs_to :company
end
