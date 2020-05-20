class ItemSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :merchant
  attributes :id, :name, :description, :unit_price, :merchant_id

  attribute :unit_price do |object|
    object.unit_price.to_f
  end
end
