FactoryBot.define do
  factory :boba_tea do
    image { "MyString" }
    name { "MyString" }
    price { 1.5 }
    type { "" }
    purchasable { 1 }
    description { "MyString" }
    teahouse { nil }
  end
end
