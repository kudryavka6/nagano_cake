class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.postage = 800
    if params[:order][:address_option] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_option] == "2"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    end

    @total = 0
  end

  def index

  end

  def show

  end

  def create
    @cart_items = current_customer.cart_items
    @order = current_customer.orders.new(order_params)
    @order.status = 0
    @order.save
    @cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.price = cart_item.item.add_tax_price
      order_detail.quantity = cart_item.amount
      order_detail.making_status = 0
      order_detail.item_id = cart_item.item.id
      order_detail.order_id = @order.id
      order_detail.save
    end
    @cart_items.destroy_all
    redirect_to orders_thanks_path
  end

  private
    def order_params
      params.require(:order).permit(:payment_method, :postal_code, :address, :name, :postage, :total_payment)
    end
end
