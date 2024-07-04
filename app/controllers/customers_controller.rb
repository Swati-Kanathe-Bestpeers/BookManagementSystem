class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end
  
  def new
    @customer = Customer.find(params[:id])
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def create
    @customer = Customer.find(params[:id])
    if @customer.after_save 
      redirect_to customers_path
    else
      render 'new'
    end
  end
  
  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_param)
    redirect_to customers_path
  end
  
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to customers_path
  end
  private 
    def customer_param
      params.require(:customer).permit(:first_nm, :last_nm,:title, :email,:visit,:order_count)
    end
end
  

