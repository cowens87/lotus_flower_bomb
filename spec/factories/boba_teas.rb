FactoryBot.define do
  factory :boba_tea do 
    teahouse
    image       {"/images/#{rand(1..12)}.jpeg"}
    name        {"#{Faker::Movies::Hobbit.character} Tea Blend"}
    price       {Faker::Commerce.price}
    base        {Faker::Coffee.variety }
    purchasable {1}
    description {Faker::Coffee.notes}
  end
end 