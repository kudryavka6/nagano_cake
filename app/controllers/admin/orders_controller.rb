class Admin::OdersController < ApplicationController
  def show
     @order = Order.find(params[:id])
     @item = Item.find(params[:id])
  end
  private
  def order_params
     params.require(:order).permit(:name, :created_at, :address, :payment_method, :status)
  end
  
  def item_params
     params.require(:item).permit()
  end
end