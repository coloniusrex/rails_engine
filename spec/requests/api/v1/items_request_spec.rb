require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
    create_list(:item, 3)

    get "/api/v1/items"

    expect(response).to be_successful

    items = JSON.parse(response.body, symbolize_headers: true)

    expect(items[:data].count).to eql(3)
  end

  it "can get one item by it's ID" do
    id = create(:item).id

    get "/api/v1/items/#{id}"

    expect(response).to be_successful

    item = JSON.parse(response.body, symbolize_headers: true)

    expect(item["id"]).to eql(id)
  end

  it "can create a new item" do
    merchant = create(:merchant)
    item_params = { name: "Rocket", description: "Shoots very high!", unit_price: 12343, merchant_id: merchant.id}

    post "/api/v1/items", params: {item: item_params}

    expect(response).to be_successful

    item = JSON.parse(response.body, symbolize_headers: true)
    last_item = Item.last
    expect(last_item.name).to eql(item_params[:name])
  end

  it "can update an existing item" do
    item_1 = create(:item)
    old_name = item_1.name
    item_params = { name: "Rocket", description: "Shoots very high! Engines not included.", unit_price: 3}

    put "/api/v1/items/#{item_1.id}", params: {item: item_params}

    expect(response).to be_successful

    item = JSON.parse(response.body, symbolize_headers: true)
    last_item = Item.last
    expect(last_item.name).to eql(item_params[:name])
  end

  it "can destroy an existing item" do
    item_1 = create(:item)

    expect(Item.count).to eq(1)

    delete "/api/v1/items/#{item_1.id}"

    expect(response).to be_successful
    expect(Item.count).to eql(0)
    expect{Item.find(item_1.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
