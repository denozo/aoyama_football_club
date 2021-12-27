class Admins::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end

  def update
  end

end
