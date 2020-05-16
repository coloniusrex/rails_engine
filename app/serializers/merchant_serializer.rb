class MerchantSerializer < ActiveModel::Serializer
  type 'merchant'
  
  attributes :id, :name

end
