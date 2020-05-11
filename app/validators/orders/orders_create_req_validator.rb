require_relative './schemas/order_schema.rb'

module OrdersCreateReqValidator

  SCHEMA = OrderSchema

  def validate_create(params)
    SCHEMA.call(params).errors.to_h
  end
end

