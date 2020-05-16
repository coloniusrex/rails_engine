require 'rails_helper'

describe "Customers API" do
  it "sends a list of invoice_items" do
    create_list(:customer, 3)

    get "/api/v1/invoice_items"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body, symbolize_headers: true)
    expect(invoice_items.count).to eql(3)
  end
end
