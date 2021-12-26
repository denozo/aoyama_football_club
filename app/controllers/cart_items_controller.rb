class CartItemsController < ApplicationController

  def index
    @cart_items = current_cart.cart_items

    #合計金額の計算
    # @sum = 0
    # @cart_items.each do |cart_item|
    #   @sum += cart_item.subtotal
    # end
  end

  def update
  end

  def destroy
  end

  def destroyall
  end

  def create
    cart = current_cart
    item = Item.find(params[:item_id])
    cart_item = cart.add_item(item.id)

    if(cart_item.amount)
      cart_item.amount += params[:amount].to_i
      cart_item.save
      redirect_to cart_items_path, notice: 'お問い合わせ内容を送信しました'
    else
      cart_item.amount = params[:amount].to_i
      cart_item.save
      redirect_to item_path(item)
    end

  end


private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :cart_id)
  end

end