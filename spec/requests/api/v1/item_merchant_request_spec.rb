require 'rails_helper'

describe "Item Merchant API" do
  it "can return the merchant associated with the item" do
    merchant = create(:merchant)
    item = merchant.items.create(attributes_for(:item))

    get "/api/v1/items/#{item.id}/merchant"

    expect(response).to be_successful
    item_merchant = JSON.parse(response.body, symbolize_headers: true)

    expect(item_merchant["data"]["id"]).to eql("#{merchant.id}")
    expect(item_merchant["data"]["type"]).to eql("merchant")
    expect(item_merchant["data"]["attributes"]["name"]).to eql("#{merchant.name}")
    expect(item_merchant["data"].count).to eql(3)
  end
end
