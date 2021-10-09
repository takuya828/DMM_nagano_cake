class AddressesController < ApplicationController

  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def new
    @address = Address.new
  end

  def create
     @address = Address.new(address_params)
     @address.customer_id = current_customer.id
     if @address.save
      flash[:success] = "You have created address successfully."
      redirect_to addresses_path
     else
      redirect_to addresses_path
     end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
       flash[:success] = "You have updated address successfully."
       redirect_to addresses_path
    else
      @address = Address.find(params[:id])
      flash[:danger] = "error"
      redirect_to addresses_path
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def delete
    @address = Address.find(params[:id])
    @address.delete
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end

end