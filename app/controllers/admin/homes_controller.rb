class Admin::HomesController < ApplicationController
      before_action :authenticate_admin!

  def top
    @orders = Order.all
  end

  def about
  end

end
