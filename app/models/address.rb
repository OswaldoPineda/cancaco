class Address < ApplicationRecord
  belongs_to :company
  validates :zip_code, :city, :state, :neighborhood, :street, :outdoor_number, presence: true
end
