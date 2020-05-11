class PaymentSerializer
  include FastJsonapi::ObjectSerializer

  set_key_transform :camel_lower

  attributes :type, :value
end
