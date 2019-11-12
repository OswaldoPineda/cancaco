FactoryBot.define do
  factory :image do
    file { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'missing.png'), 'image/png') }
  end
end

FactoryBot.define do
  factory :fake_image, class: Image do
    img = Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'missing.png'), 'image/png')
    file_file_name { img.original_filename }
    file_content_type { img.content_type }
  end
end
