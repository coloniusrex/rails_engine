require 'rails_helper'

describe "Merchant Items API" do
  xit "can return a merchants list of items" do
    merchant = create(:merchant)
    item1 = merchant.items.create(attributes_for(:item))
    item2 = merchant.items.create(attributes_for(:item))
    item3 = merchant.items.create(attributes_for(:item))


    require "pry"; binding.pry
  end
end
