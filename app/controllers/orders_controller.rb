class OrdersController < ApplicationController
  def index
    @orders = Order.all.order("Id ASC")
  end

  def new
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.find(params[:id])
    if @order.after_save
      redirect_to orders_path
    else
      render 'new'
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(param_order)
    redirect_to orders_path
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy(param_order)
    redirect_to orders_path
  end
  private
  def param_order
    params.require(:orders).permit(:status, :tax, :total)
  end
end
