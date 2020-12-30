class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :destroy, :edit]
  before_action :item_find, only: [:show, :edit, :update]
  before_action :move_root, only: [:edit, :update]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :info, :category_id, :status_id, :shipping_id, :prefecture_id, :schedule_id,
                                 :price).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end

  def move_root
    redirect_to root_path if user_signed_in? && current_user.id != @item.user_id
  end

end