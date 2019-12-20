FactoryBot.define do
  factory :sale do
    title { 'Laptop lenovo p30' }
    description { 'New laptop on sale.' }
    extra_info { 'Color: Red' }
    quantity { 1 }
    price { 1500 }
  end
end

FactoryBot.define do
  factory :sale_image, class: Sale do
    title { 'Producto random' }
    description { 'Something...' }
    extra_info { 'Amazing!' }
    quantity { 1 }
    price { 1500 }
    after(:create) do |sale|
      create(:fake_image, sale: sale)
    end
  end
end
