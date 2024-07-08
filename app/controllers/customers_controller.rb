class CustomersController < ApplicationController
  
  # http_basic_authenticate_with name: "username", password: "password"
  protect_from_forgery with: :null_session

  def index
    @customers = Customer.all
    # render json: @customers
  end
  
  def new
    @customer = Customer.new
  end
  
  def show
    @customer = Customer.find(params[:id])
    # render json: @customer
  end
  
  def edit
    @customer = Customer.find(params[:id])
    # render json: @customer
  end
  
  def create
    @customer = Customer.new(customer_param)
    if @customer.after_save 
      redirect_to customers_path
    else
      render json: {:errors => @customer.errors.full_messages}
    end
    
  end
  
  def update
    @customer = Customer.find(params[:id])
    # render json: @customer
    if @customer.update(customer_param)
      redirect_to customers_path
    else
      render 'new'
    end
  end
  
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to customers_path
    # render json: @customer
  end
  private 
    def customer_param
      params.require(:customer).permit(:first_nm, :last_nm,:title, :email,:visit,:order_count,:lock_version)
    end
end
  

