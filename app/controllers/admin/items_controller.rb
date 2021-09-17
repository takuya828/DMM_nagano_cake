class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to new_admin_item_path
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

   private
  def item_params
    params.require(:item).permit(:id, :genre_id, :name, :image_id, :introduction, :price)
  end

end