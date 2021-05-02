class SerializableUserAddress < JSONAPI::Serializable::Resource
  type 'user_addresses'

  attributes :address_1, :address_2, :province, :country, :zip_code, :main_address
end
