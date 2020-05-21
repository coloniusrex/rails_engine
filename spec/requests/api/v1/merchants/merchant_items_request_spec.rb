require 'rails_helper'

describe "Merchant Items API" do
  it "can return a merchants list of items" do
    merchant = create(:merchant)
    item1 = merchant.items.create(attributes_for(:item))
    item2 = merchant.items.create(attributes_for(:item))
    item3 = merchant.items.create(attributes_for(:item))

    get "/api/v1/merchants/#{merchant.id}/items"

    expect(response).to be_successful

    merchant_items = JSON.parse(response.body, symbolize_headers: true)

    expect(merchant_items["data"].first["id"]).to eql("#{item1.id}")
    expect(merchant_items["data"].first["type"]).to eql("item")
    expect(merchant_items["data"].first["attributes"]["name"]).to eql("#{item1.name}")
    expect(merchant_items["data"].count).to eql(3)
  end
end
