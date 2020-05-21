require 'rails_helper'

describe "Merchants Single Finder API Query" do
  it "It can return a single merchant by name string fragment" do
    create_list(:merchant, 3, name: "Not tril")
    merchant = create(:merchant, name: 'Super trill')
    create_list(:merchant, 3, name: "take the wheil")

    get '/api/v1/merchants/find?name=ILL'
    json = JSON.parse(response.body, symbolize_names: true)
    name = json[:data][:attributes][:name].downcase

    expect(json[:data]).to be_a(Hash)
    expect(name).to include('ill')
  end
end
