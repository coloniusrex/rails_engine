class CustomerSerializer < ActiveModel::Serializer
  type 'customer'
  attributes :id

  def id
    object.id.to_s
  end
end
