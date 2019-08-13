class Company < ApplicationRecord
  has_many :address, dependent: :destroy
  has_one :user, dependent: :destroy
  belongs_to :category, dependent: :destroy
  accepts_nested_attributes_for :address
  validates :name, length: { minimum: 2, maximum: 100 }, presence: true
  validates :affiliation, presence: true, length: { is: 10 }, on: :create
  has_many :notifications, foreign_key: :recipient_id, dependent: :delete_all
  has_many :conversations, dependent: :delete_all
end
