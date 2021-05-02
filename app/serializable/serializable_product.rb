class SerializableProduct < JSONAPI::Serializable::Resource
  type 'products'

  attributes :title, :description, :image, :price, :sku, :stock_number
end
