class Image < ApplicationRecord
  belongs_to :sale
  has_attached_file :file,
                    storage: :fog,
                    path: ':class/:attachment/:id_partition/:filename',
                    fog_host: ENV['FOG_HOST']
  validates_attachment_content_type :file, content_type: ["image/jpg", "image/jpeg", "image/png"]
end
