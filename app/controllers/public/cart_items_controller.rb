class Public::CartItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def create
    if
      
    else
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path
    end
  end

  def update
    @cart_item = Cart_items.find(params[id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path(@cart_item)
  end

  def destroy

  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
