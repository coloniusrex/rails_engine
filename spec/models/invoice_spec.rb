require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:status)}
  end

  describe "Relationships" do
    it { should have_many(:items).through(:invoice_items)}
    it { should have_many(:invoice_items).dependent(:destroy)}
  end
end
