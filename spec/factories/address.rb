FactoryBot.define do
  factory :address do
    zip_code { '29000' }
    city { 'Colima' }
    state { 'Villa de alvarez' }
    street { 'Aldama' }
    neighborhood { 'Centro' }
    association :company
  end
end
