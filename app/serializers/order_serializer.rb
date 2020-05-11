class OrderSerializer
  include FastJsonapi::ObjectSerializer

  attribute :total_shipping

  set_key_transform :camel_lower

  attributes :external_code, :store_id, :sub_total, :delivery_fee, :total, 
  :country, :state, :city, :district, :street, :complement, :latitude, 
  :longitude, :dt_order_create, :postal_code, :number     
end
