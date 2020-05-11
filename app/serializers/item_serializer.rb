class ItemSerializer
  include FastJsonapi::ObjectSerializer

  set_key_transform :camel_lower

  attributes :external_code, :name, :price, :quantity, :total
end
