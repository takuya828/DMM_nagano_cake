class CartItemsController < ApplicationController

  def new
  end

  def index
    @cart_items = current_customer.cart_items.all
    @cart_item = CartItem
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  def update
      @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
       flash[:success] = "You have updated amount successfully."
       redirect_to cart_items_path
    else
      @cart_item = CartItem.find(params[:id])
      flash[:danger] = "error"
      redirect_to cart_items_path
    end
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
     if @cart_item.save!
      flash[:success] = "You have created cart_item successfully."
      redirect_to items_path
     else
      flash[:danger] = "error"
      redirect_to items_path
     end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.delete
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = CartItem.all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

   def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
   end

 end