class Admins::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @orders = Order.page(params[:page]).per(10).order(created_at: "DESC")
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)

    @sum = 0

    @order_details.each do |order_details|
      @sum += order_details.price
    end

  end

  def update

    order = Order.find(params[:id])

    if order.update(order_params)
      redirect_to admins_order_path, notice: "注文情報を更新しました"
    else
      render :show, alert: "更新できませんでした"
    end

  end

  private

  def order_params
    params.require(:order).permit(:order_status, :delivery_date)
  end

end
