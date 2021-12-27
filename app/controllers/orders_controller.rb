class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm

    #カート内の値を取得
    @cart_items = current_cart.cart_items
    

    # 個数合計
    @amount_sum = 0
    @cart_items.each do |cart_item|
      @amount_sum += cart_item.amount
    end

    # 合計金額の計算
    @sum = 0
    @cart_items.each do |cart_item|
      @sum += cart_item.subtotal
    end

    #請求金額の計算(商品合計＋送料)

    @order = Order.new(order_params)
    total_payment = @sum + 800
    @order.total_payment = total_payment.to_i
    @order.shipping_cost = 800

  end

  def create
    order = Order.new(order_params)
    order.save
    
    cart_items = current_cart.cart_items
      cart_items.each do |cart_item|
        order_details = OrderDetail.new
        order_details.item_id = cart_item.item.id
        order_details.order_id = order.id
        order_details.price = cart_item.subtotal
        order_details.amount = cart_item.amount
        order_details.save
      end
    
    cart_items = current_cart.cart_items
    cart_items.destroy_all
    
    redirect_to thanks_orders_path
    
  end
  
  def thanks
  end


  private

  def order_params
    params.require(:order).permit(:name, :product_passing, :other, :postal_code, :address, :addressee, :shipping_cost, :total_payment, :payment_method, :order_status)
  end

end