class Admin::OrdersController < ApplicationController
      before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @postage = 800
    @total = @order_items.sum(:unit_price)
  end


  private
    def order_item_params
		 params.require(:order_item)
	  end

end