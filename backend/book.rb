class Book
  attr_reader :name, :value

  def initialize(name:, value:)
    @name = name
    @value = value
  end

  def ship(order)
    print_shipping_label(order.address.zipcode)
  end

  private

  def print_shipping_label(shipping_zipcode)
    shipping_zipcode + " Item isento de impostos conforme disposto na Constituição Art. 150, VI, d."
  end
end