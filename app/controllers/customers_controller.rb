class CustomersController < ApplicationController
 before_action :authenticate_customer!

def show
 @customer = current_customer
end

 def edit
  @customer = Customer.find(params[:id])
 end

 def update
 @customer = current_customer
 if @customer.update(customer_params)
       flash[:success] = "You have updated info successfully."
       redirect_to  customers_mypage_path(@customer.id)
 else
       flash[:danger] = "error"
       redirect_to customers_mypage_path(@customer.id)
    end
end

private

   def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
   end
end