class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :unit_price, :merchant_id

  def id
    object.id.to_s
  end

  def unit_price
    object.unit_price.to_s
  end

end
