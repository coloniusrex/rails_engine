require 'rails_helper'

describe "Customers API" do
  it "sends a list of customers" do
    create_list(:customer, 3)

    get "/api/v1/customers"

    expect(response).to be_successful

    customers = JSON.parse(response.body, symbolize_headers: true)
    expect(customers.count).to eql(3)
  end

  it "can get one customer by it's ID" do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"

    expect(response).to be_successful

    customer = JSON.parse(response.body, symbolize_headers: true)
    expect(customer["id"]).to eql(id)
  end

  it "can create a new customer" do
    customer_params = { first_name: "Stephanie", last_name: "Hill"}

    post "/api/v1/customers", params: {customer: customer_params}

    expect(response).to be_successful

    customer = JSON.parse(response.body, symbolize_headers: true)
    expect(Customer.last.first_name).to eql(customer_params[:first_name])
  end

  it "can update an existing customer" do
    customer_1 = create(:customer)
    old_first_name = customer_1.first_name
    customer_params = { first_name: "Sam", last_name: "Hill" }

    put "/api/v1/customers/#{customer_1.id}", params: {customer: customer_params}

    expect(response).to be_successful

    customer = JSON.parse(response.body, symbolize_headers: true)
    expect(Customer.last.first_name).to eql(customer_params[:first_name])
  end

  it "can destroy an existing customer" do
    customer_1 = create(:customer)

    expect(Customer.count).to eq(1)

    delete "/api/v1/customers/#{customer_1.id}"

    expect(response).to be_successful
    expect(Customer.count).to eql(0)
    expect{Customer.find(customer_1.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
