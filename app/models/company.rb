class Company < ApplicationRecord
  belongs_to :user
  has_one :address
  accepts_nested_attributes_for :address
  validates :affiliation, :name, :phone, presence: true
  validates :name, length: { minimum: 2, maximum: 100 }
  validates :phone, length: { is: 7 }
  validates :cellphone, length: { maximum: 10 }
  validates :affiliation, length: { is: 10 }
  validates :phone, :cellphone, format: { with: /\A\d+\z/, alert: 'Solo se permiten caracteres en los telefonos.' }
end
