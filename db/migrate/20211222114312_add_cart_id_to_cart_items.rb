class AddCartIdToCartItems < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_items, :cart_, :integer
  end
end
