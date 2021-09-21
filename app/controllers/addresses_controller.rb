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
     end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end

end