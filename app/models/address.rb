class Address < ApplicationRecord
  belongs_to :company
  validates :zip_code, :city, :state, :neighborhood, :street, presence: true
end
