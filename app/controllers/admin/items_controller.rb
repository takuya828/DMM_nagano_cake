class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = "You have created item successfully."
      redirect_to admin_item_path(@item)
    else
      @item = Item.new(item_params)
      flash[:danger] = "error"
      redirect_to new_admin_item_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
       flash[:success] = "You have updated item successfully."
       redirect_to admin_item_path
    else
      @item = Item.find(params[:id])
      flash[:danger] = "error"
      redirect_to admin_item_path
    end
  end

   private
  def item_params
    params.require(:item).permit(:id, :genre_id, :name, :image, :introduction, :price)
  end

end