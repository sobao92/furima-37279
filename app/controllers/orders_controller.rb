class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(order_params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(order_params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end
end
