require_relative '../../mappers/orders_req_to_domain_obj.rb'

class SaveOrderService

  # Mapper
  include OrdersReqToDomainObj

  def initialize(params)
    @order = map_order(params)
    @customer = map_customer(params)
    @payments = map_payments(params)
    @items = map_items(params)
  end

  def execute
    @customer.save!
    
    @order.customer_id = @customer.id
    @order.save!
    
    @items.map{ |i|
      i.order_id = @order.id
    }
    
    @payments.map{ |p|
      p.order_id = @order.id
    }
    
    @items.each(&:save!)
    @payments.each(&:save!)

    return {
      order: @order,
      customer: @customer,
      items: @items,
      payments: @payments
    }
    
  end
end