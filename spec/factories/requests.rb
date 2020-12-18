FactoryBot.define do
  factory :request do
    name { "MyString" }
    address { "MyString" }
    city { "MyString" }
    state { "MyString" }
    zip { 1 }
    reason { "MyString" }
    status { 1 }
  end
end
