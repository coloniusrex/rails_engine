require 'rails_helper'

describe "Items Single Finder API Query" do
  it "It can return a single item by name string fragment" do
    create_list(:item, 3, name: "Not tril")
    item = create(:item, name: 'Super trill')
    create_list(:item, 3, name: "take the wheil")

    get '/api/v1/items/find?name=ILL'
    json = JSON.parse(response.body, symbolize_names: true)

    name = json[:data][:attributes][:name].downcase

    expect(json[:data]).to be_a(Hash)
    expect(name).to include('ill')
  end

  it "It can return a single item by description word" do
    create_list(:item, 3, description: "Play with numbers!")
    item = create(:item, description: "Play with shapes!")
    create_list(:item, 3, description: "Play with colors!")

    get '/api/v1/items/find?description=shape'
    json = JSON.parse(response.body, symbolize_names: true)
    description = json[:data][:attributes][:description].downcase

    expect(json[:data]).to be_a(Hash)
    expect(description).to include('shape')
  end

  it "It can return a single item by name AND description word" do
    create_list(:item, 3, name: "Not tril", description: "Play with numbers!")
    item = create(:item, name: 'Super trill', description: "Play with shapes!")
    create_list(:item, 3, name: "take the wheil", description: "Play with colors!")

    get '/api/v1/items/find?description=shape&name=il'
    json = JSON.parse(response.body, symbolize_names: true)

    description = json[:data][:attributes][:description].downcase

    expect(json[:data]).to be_a(Hash)
    expect(description).to include('shape')
  end
end

describe "Multi-Item Finder API Query" do
  it "It can return a list of items by name string fragment" do
    create_list(:item, 3, description: "Play with numbers!")
    item = create(:item, description: "Play with shapes!")
    create_list(:item, 3, description: "Play with colors!")

    get '/api/v1/items/find_all?description=rs'
    json = JSON.parse(response.body, symbolize_names: true)

    description = json[:data].first[:attributes][:description].downcase

    expect(json[:data]).to be_a(Array)
    expect(json[:data].first).to be_a(Hash)
    expect(description).to include('rs')
  end

  it "It can return a list of items by description fragment" do
    create_list(:item, 3, description: "Play with numbers!")
    item = create(:item, description: "Play with shapes!")
    create_list(:item, 3, description: "Play with colors!")

    get '/api/v1/items/find_all?description=olo'
    json = JSON.parse(response.body, symbolize_names: true)

    description = json[:data].first[:attributes][:description].downcase

    expect(json[:data]).to be_a(Array)
    expect(json[:data].count).to eql(3)
    expect(json[:data].first).to be_a(Hash)
    expect(description).to include('olo')
  end
end
