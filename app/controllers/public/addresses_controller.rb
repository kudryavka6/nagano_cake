class Public::AddressesController < ApplicationController
  def index
    @customer = current_customer
    @address = Address.new
    @addresses = Address.all
  end

  def edit

  end

  def create

  end

  def update

  end

  def destroy

  end
end
