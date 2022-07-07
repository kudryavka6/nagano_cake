class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index

  end

  def show

  end

  def create

  end

  private
    def orders
      params.require(:order).permit(:payment_method, :total_payment)
    end

end
