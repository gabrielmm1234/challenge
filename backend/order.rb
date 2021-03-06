require_relative "order_item"
require_relative "address"

class Order
  attr_reader :customer, :items, :payment, :address, :closed_at

  def initialize(customer, overrides = {})
    @customer = customer
    @items = []
    @order_item_class = overrides.fetch(:item_class) { OrderItem }
    @address = overrides.fetch(:address) { Address.new(zipcode: '45678-979') }
  end

  def add_item(item)
    @items << @order_item_class.new(order: self, item: item)
  end

  def total_amount
    @items.map{ |order_item| order_item.item.value }.inject(:+)
  end

  def close(closed_at = Time.now)
    @closed_at = closed_at
  end

  def grant_discount_voucher
    p "Concedido um voucher de desconto para #{@customer.name}, de R$ 10 associado ao pagamento."
  end
end
