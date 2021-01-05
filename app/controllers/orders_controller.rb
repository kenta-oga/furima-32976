class OrdersController < ApplicationController

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def new

  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    end
  end

  private

  def order_params
    params.require(:order_address).perrmit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_num)
  end
end

