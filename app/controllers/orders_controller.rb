class OrdersController < ApplicationController

  def show
  end

  def index
    @orders = current_customer.orders.all
  end

  def check
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
       @address = Address.find(params[:order][:address_id])
       @order.postal_code = @address.postal_code
       @order.address = @address.address
       @order.name = @address.name
    elsif params[:order][:select_address] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      @address = Address.new
    end
    @cart_items = current_customer.cart_items.all
    @cart_item = CartItem
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    @postage = 500
    @order.price = @total
  end

  def new
    @customer = current_customer
    @addresses = current_customer.addresses
    @address = Address.new
    @order = Order.new
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
      redirect_to thanks_orders_path
  end


  def thanks
  end

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_type, :price)
  end

end