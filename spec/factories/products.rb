FactoryBot.define do
  factory :product do
    title { "MyProduct" }
    description { "MyDescription" }
    price { 1.5 }
    category { nil }
    stock { 10 }
  end
end
