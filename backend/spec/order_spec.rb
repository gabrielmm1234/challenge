require 'spec_helper'

describe Order do
  before do
    foolano = Customer.new(name: "Gabriel", email: "gabrieljustware@gmail.com")
    @order = Order.new(foolano)
  end

  it "Adds a new product to Order items" do
    book = Product.new(name: 'Awesome book', type: :book)
    @order.add_product(book)
    expect(@order.items.size).to eq(1)
  end

  it "returns the Order total_amount" do
    first_book = Product.new(name: 'Awesome book', type: :book)
    second_book = Product.new(name: 'Second Awesome book', type: :book)
    @order.add_product(first_book)
    @order.add_product(second_book)
    expect(@order.total_amount).to eq(20)
  end

  it "closes the Order" do
    closed_at = Time.now
    @order.close(closed_at)
    expect(@order.closed_at).to eq(closed_at)
  end
end
