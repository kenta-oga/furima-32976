class OrdersController < ApplicationController

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def new

  end

  def create

  end
end
