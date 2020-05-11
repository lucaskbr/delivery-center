class SendOrderToDeliveryService

  URL = 'https://delivery-center-recruitment-ap.herokuapp.com'

  def initialize(order_hash)
    @order = OrderSerializer.new(order_hash[:order]).serializable_hash
    @payments = PaymentSerializer.new(order_hash[:payments]).serializable_hash
    @items = ItemSerializer.new(order_hash[:items]).serializable_hash
    @customer = CustomerSerializer.new(order_hash[:customer]).serializable_hash
  end

  def execute

    body = @order[:data][:attributes]
    body[:payments] = @payments[:data].map { |child| child[:attributes] }
    body[:items] = @items[:data].map { |child| child[:attributes] }
    body[:customer] = @customer[:data][:attributes]

    response = RestClient.post(URL, body.to_json) { |response, request, result|
      return response
    }
    
    return response

  end
end