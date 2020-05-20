FactoryBot.define do
  factory :invoice do
    customer_id {create(:customer).id}
    merchant_id {create(:merchant).id}
    status { 'shipped' }
  end
end
