class SerializableRegion < JSONAPI::Serializable::Resource
  type 'regions'

  attributes :title, :country, :currency, :tax
end
