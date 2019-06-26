class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  belongs_to :company, optional: true, dependent: :destroy
  accepts_nested_attributes_for :company
  validates :full_name, :email, :password, presence: true
  validates :email, format: { with: Devise.email_regexp }
end
