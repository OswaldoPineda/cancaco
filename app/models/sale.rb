class Sale < ApplicationRecord
  validates :title, :description, :extra_info, :quantity, :price, presence: true
  belongs_to :category
  belongs_to :company

  has_attached_file :document,
                    storage: :fog,
                    path: ':class/:attachment/:id_partition/:filename',
                    fog_host: ENV['FOG_HOST']

  validates_attachment_content_type :document, content_type: /pdf/

  # has_many :images, dependent: :destroy
  # accepts_nested_attributes_for :images
end
