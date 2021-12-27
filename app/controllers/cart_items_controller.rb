class CartItemsController < ApplicationController

  def index
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

  end

  def update
    @cart_item = CartItem.find(params[:id])

    if @cart_item.update(amount: params[:amount])
      redirect_to cart_items_path, notice: 'カート情報を更新しました！'
    else
      render cart_item_path
    end

  end

  def destroy
    cart_item = CartItem.find(params[:id])

    if cart_item.destroy
      redirect_to cart_items_path, notice: '商品を削除しました！'
    else
      render cart_items_path
    end
  end

  def destroyall
    cart_items = current_cart.cart_items

    if cart_items.destroy_all
      redirect_to cart_items_path, notice: 'カートを空にしました！'
    else
      render cart_items_path
    end
  end

  def create
    cart = current_cart
    item = Item.find(params[:item_id])
    cart_item = cart.add_item(item.id)

    if(cart_item.amount)
      cart_item.amount += params[:amount].to_i
      cart_item.save
      redirect_to cart_items_path, notice: '個数を追加しました！'
    else
      cart_item.amount = params[:amount].to_i
      cart_item.save
      redirect_to cart_items_path, notice: '商品を新規追加しました！'
    end

  end


private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :cart_id)
  end

end