require 'rails_helper'

xdescribe 'business intelligence' do
  it 'can get merchants with most revenue' do
    get "/api/v1/merchants/most_revenue?quantity=7"
    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data].length).to eq(7)

    expect(json[:data][0][:attributes][:name]).to eq("Kassulke, O'Hara and Quitzon")
    expect(json[:data][0][:id]).to eq("89")

    expect(json[:data][3][:attributes][:name]).to eq("Kozey Group")
    expect(json[:data][3][:id]).to eq("12")

    expect(json[:data][6][:attributes][:name]).to eq("Marvin, Renner and Bauch")
    expect(json[:data][6][:id]).to eq("49")
  end

  it 'can get merchants who have sold the most items' do
    get "/api/v1/merchants/most_items?quantity=8"

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data].length).to eq(8)

    expect(json[:data][0][:attributes][:name]).to eq("Kassulke, O'Hara and Quitzon")
    expect(json[:data][0][:id]).to eq("89")

    expect(json[:data][3][:attributes][:name]).to eq("Thiel Inc")
    expect(json[:data][3][:id]).to eq("22")

    expect(json[:data][7][:attributes][:name]).to eq("Sporer, Christiansen and Connelly")
    expect(json[:data][7][:id]).to eq("56")
  end

  it 'can get revenue between two dates' do
    get '/api/v1/revenue?start=2012-03-09&end=2012-03-24'

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:attributes][:revenue].to_f.round(2)).to eq(43201227.80)
  end
end
