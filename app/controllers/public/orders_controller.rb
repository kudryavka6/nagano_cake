class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm

  end

  def index

  end

  def show

  end

  def create
    @order = Order.new(order_params)
    @orders.save
    redirect_to orders_confirm_path
  end

  private
    def orders
      params.require(:order).permit(:payment_method)
    end

end
