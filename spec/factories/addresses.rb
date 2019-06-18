FactoryBot.define do
  factory :address do
    zipCode { '29000' }
    city { 'Colima' }
    state { 'Villa de alvarez' }
    street { 'Aldama' }
    neighborhood { 'Centro' }
    association :company
  end
end
