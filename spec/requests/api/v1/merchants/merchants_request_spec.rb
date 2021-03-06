require 'rails_helper'

describe "Merchants API" do
  it "sends a list of merchants" do
    create_list(:merchant, 3)

    get "/api/v1/merchants"

    expect(response).to be_successful

    merchants = JSON.parse(response.body, symbolize_headers: true)

    expect(merchants["data"].first["type"]).to eql("merchant")
    expect(merchants["data"].first["attributes"]).to have_key("name")
    expect(merchants["data"].count).to eql(3)
  end

  it "can get one merchant by it's ID" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body, symbolize_headers: true)
    expect(merchant["data"]["id"]).to eql("#{id}")
    expect(merchant["data"]["type"]).to eql("merchant")
    expect(merchant["data"]["attributes"]).to have_key("name")
  end

  it "can create a new merchant" do
    merchant_params = { name: "SuperSuds" }

    post "/api/v1/merchants", params: merchant_params

    expect(response).to be_successful

    merchant = JSON.parse(response.body, symbolize_headers: true)

    expect(merchant["data"]["id"]).to eql("#{Merchant.last.id}")
    expect(merchant["data"]["type"]).to eql("merchant")
    expect(merchant["data"]["attributes"]["name"]).to eql(merchant_params[:name])
  end

  it "can update an existing merchant" do
    merchant_1 = create(:merchant)
    old_name = merchant_1.name
    merchant_params = { name: "SuperSuds" }

    put "/api/v1/merchants/#{merchant_1.id}", params: merchant_params

    expect(response).to be_successful

    merchant = JSON.parse(response.body, symbolize_headers: true)
    expect(Merchant.last.name).to eql(merchant_params[:name])
    expect(Merchant.last.name).to_not eql(old_name)
    expect(merchant["data"]["attributes"]["name"]).to eql(merchant_params[:name])
    expect(merchant["data"]["attributes"]["name"]).to_not eql(old_name)
  end

  it "can destroy an existing merchant" do
    merchant_1 = create(:merchant)

    expect(Merchant.count).to eq(1)

    delete "/api/v1/merchants/#{merchant_1.id}"

    expect(response).to be_successful
    destroyed = JSON.parse(response.body, symbolize_headers: true)

    expect(destroyed["data"]["id"]).to eql("#{merchant_1.id}")
    expect(destroyed["data"]["attributes"]["name"]).to eql("#{merchant_1.name}")

    expect(Merchant.count).to eql(0)
    expect{Merchant.find(merchant_1.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
