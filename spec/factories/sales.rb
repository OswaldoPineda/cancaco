FactoryBot.define do
  factory :sale do
    title { 'Laptop lenovo p30' }
    description { 'New laptop on sale.' }
    extra_info { 'Color: Red' }
    quantity { 1 }
    price { 1500 }
  end
end
