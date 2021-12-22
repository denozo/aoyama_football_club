class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :name, null: false
      t.integer :product_passing, null: false, default: 0
      t.string :other
      t.string :postal_code
      t.string :address
      t.string :addressee
      t.integer :shipping_cost
      t.integer :total_payment, null: false
      t.integer :payment_method, null: false, default: 0
      t.integer :order_status, null: false, default: 0
      t.datetime :delivery_date

      t.timestamps
    end
  end
end
