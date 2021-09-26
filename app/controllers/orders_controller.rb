class OrdersController < ApplicationController

  def show
  end

  def index
  end

  def new
    @customer = current_customer
    @addresses = current_customer.addresses
    @order = Order.new
  end

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_type, :price, :postage, :order_status, :customer_id)
  end

 end