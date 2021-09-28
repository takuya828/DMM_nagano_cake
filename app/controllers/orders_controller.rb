class OrdersController < ApplicationController

  def show
  end

  def index
  end

  def check
    @order = Order.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
    @address = Address.find(params[:order][:address_id])
    @cart_items = CartItem.all
    @cart_item = CartItem
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    @postage = 800
  end

  def new
    @customer = current_customer
    @addresses = current_customer.addresses
    @address = Address.new
    @order = Order.new
  end

  def thanks
  end

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_type, :price, :postage, :order_status, :customer_id)
  end

 end