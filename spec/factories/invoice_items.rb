FactoryBot.define do
  factory :invoice_item do
    item_id { create(:item).id }
    invoice_id { create(:invoice).id }
    quantity { Faker::Number.number(digits: 1) }
  end
end
