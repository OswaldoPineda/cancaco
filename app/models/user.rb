class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :company
  accepts_nested_attributes_for :company
  validates :first_name, :last_name, length: { minimum: 2 } 
  validates :first_name, :last_name, length: { maximum: 50 } 
  validates :first_name, :last_name, :email, :password, presence: true
  validates_format_of :email, with: Devise::email_regexp
end
