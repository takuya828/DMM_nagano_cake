class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :postal_code
      t.string :address
      t.string :name
      t.integer :payment_type
      t.integer :price
      t.integer :postage
      t.integer :order_status

      t.timestamps
    end
  end
end
