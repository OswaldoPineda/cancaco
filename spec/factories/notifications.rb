FactoryBot.define do
  factory :notification do
    company { nil }
    action { "Compra" }
    notifiable_type { "Petition" }
  end
end
