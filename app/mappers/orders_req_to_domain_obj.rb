module OrdersReqToDomainObj

  def map_order(params)
    address = params['shipping']['receiver_address']
    @order = Order.new 
    @order.external_code = params['id']
    @order.store_id = params['store_id']
    @order.sub_total = params['total_amount']
    @order.total_shipping = params['total_shipping']
    @order.delivery_fee = params['total_shipping']
    @order.total = params['total_amount_with_shipping']
    @order.country = address['country']['id']
    @order.state = address['state']['name']
    @order.city = address['city']['name']
    @order.district = address['neighborhood']['name']
    @order.street = address['street_name']
    @order.complement = address['comment']
    @order.latitude = address['latitude']
    @order.longitude = address['longitude']
    @order.dt_order_create = params['date_created']
    @order.postal_code = address['zip_code']
    @order.number = address['street_number']
    return @order 
  end

  def map_customer(params)
    buyer = params['buyer']
    @customer = Customer.new 
    @customer.external_code = buyer['id']
    @customer.name = buyer['nickname']
    @customer.email = buyer['email']
    @customer.contact = buyer['phone']['area_code'].to_s + buyer['phone']['number']
    @customer.save
    return @customer
  end

  def map_items(params)
    items = []
    params['order_items'].each do |child|
      @item = Item.new
      @item.external_code = child['item']['id']
      @item.name = child['item']['title']
      @item.price = child['unit_price']
      @item.quantity = child['quantity']
      @item.total = child['full_unit_price']
      items << @item
    end
    return items
  end

  def map_payments(params)
    payments = []
    params['payments'].each do |child|
      @payment = Payment.new
      @payment.type = child['payment_type'].upcase
      @payment.value = child['total_paid_amount']
      payments << @payment
    end
    return payments
  end

end


