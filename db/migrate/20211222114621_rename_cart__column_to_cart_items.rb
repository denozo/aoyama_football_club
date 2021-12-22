class RenameCartColumnToCartItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :cart_items, :cart_, :cart_id
  end
end
