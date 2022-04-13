class Admin::ItemsController < ApplicationController
  def index
    @item = Item.new
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end
   private
  def item_params
     params.require(:item).permit(:name, :intoroduction, :price, :is_active)
  end
end
