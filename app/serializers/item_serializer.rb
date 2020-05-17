class ItemSerializer < ActiveModel::Serializer
  type 'item'
  attributes :id, :name, :description, :unit_price, :merchant_id

  def id
    object.id.to_s
  end

  def unit_price
    object.unit_price.insert(-3, ".")
  end

end
