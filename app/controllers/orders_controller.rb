class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @postage = 800
    @total = @order_items.sum(:unit_price)
  end

  def index
    @orders = current_customer.orders.all
    @postage = 800
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
    @postage = 800
    @order.price = @total
  end

  def destroy_all
    @cart_items = CartItem.all
    current_customer.cart_items.destroy_all
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
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
    OrderItem.create(
      order_id: @order.id,
      item_id: cart_item.item_id,
      amount: cart_item.amount,
      unit_price: cart_item.item.price,
      )
     end
     @cart_items.destroy_all
      redirect_to thanks_orders_path
  end


  def thanks
  end


   private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_type, :price)
  end

  def order_item_params
    params.require(:order_item).permit(:amount, :unit_price, :order_id, :item_id)
  end
end