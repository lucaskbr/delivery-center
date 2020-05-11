class CustomerSerializer
  include FastJsonapi::ObjectSerializer

  set_key_transform :camel_lower

  attributes :external_code, :name, :email, :contact
end
