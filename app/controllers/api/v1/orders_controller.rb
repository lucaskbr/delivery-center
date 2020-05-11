require_relative '../../../validators/orders/orders_create_req_validator.rb'

require_relative '../../../services/orders/save_order_service.rb'
require_relative '../../../services/orders/send_order_to_delivery_api.rb'


class Api::V1::OrdersController < ApplicationController

  # Validators
  include OrdersCreateReqValidator

  def create
    errors = validate_create(params.permit!.to_h)

    if !errors.empty?
      render json: { errors: errors }.to_json, status: :bad_request
    end

    save_order_service = SaveOrderService.new(params)
    order = save_order_service.execute

    send_order_to_Delivery_service = SendOrderToDeliveryService.new(order)
    response = send_order_to_Delivery_service.execute

    render json: response.to_json

  end
end
