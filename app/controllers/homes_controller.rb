class HomesController < ApplicationController

  def top
    @items = Item.all.limit(4).reverse_order
  end

  def about
  end

end
