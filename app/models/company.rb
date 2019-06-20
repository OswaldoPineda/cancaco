class Company < ApplicationRecord
  belongs_to :user
  has_one :address, dependent: :destroy
  belongs_to :category, dependent: :destroy
  accepts_nested_attributes_for :address
  validates :affiliation, :name, presence: true
  validates :name, length: { minimum: 2, maximum: 100 }
  validates :affiliation, length: { is: 10 }
end
