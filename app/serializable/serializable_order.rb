class SerializableOrder < JSONAPI::Serializable::Resource
  type 'orders'

  attributes :receiver_name, :receiver_lastname, :shipping_cost, :grand_total

  attributes :order_items do
    @object.order_items
  end

  attributes :user do
    @object.user
  end

  attributes :user_address do
    @object.user_address
  end
end
