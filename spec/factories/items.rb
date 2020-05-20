FactoryBot.define do
  factory :item do
    name { Faker::Name.unique.name }
    description { Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote }
    unit_price { Faker::Number.number(digits: 5) }
    merchant_id { create(:merchant).id }
     association :merchant, factory: :merchant
  end
end
