class Address < ApplicationRecord
  belongs_to :company, inverse_of: :addresses
  validates :zip_code, :city, :state, :neighborhood, :street, presence: true
end
