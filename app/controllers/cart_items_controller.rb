class CartItemsController < ApplicationController
  def new
  end

  def index
  end

  def update
  end

  def create
  end

  def destroy
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :customer_id, :item_id)
  end

end
