FactoryBot.define do
  factory :address do
    zipCode { "" }
    city { "MyString" }
    state { "MyString" }
    street { "MyString" }
    interiorNumber { "MyString" }
    outdoorNumber { "" }
  end
end
