FactoryBot.define do
  factory :user do
    full_name { 'oswaldo pineda rivera' }
    email { 'carlos@gmail.com' }
    password { '123456' }
    avatar_file_name { 'support/missing.png' }
  end
end
