class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  belongs_to :company, optional: true, dependent: :destroy
  accepts_nested_attributes_for :company
  validates :full_name, :email, presence: true
  validates :password, presence: true, on: :create
  validates :email, format: { with: Devise.email_regexp }

  has_attached_file :avatar,
                    styles: { medium: '300x300>', thumb: '100x100>' },
                    default_url: ENV['IMG_DEFAULT'],
                    storage: :fog,
                    path: ':class/:attachment/:id_partition/:style/:filename',
                    fog_host: ENV['FOG_HOST']

  validates_attachment_content_type :avatar,
                                    content_type: /\Aimage\/.*\z/
end
