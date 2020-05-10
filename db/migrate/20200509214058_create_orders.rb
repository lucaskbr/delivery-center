class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :external_code
      t.integer :store_id
      t.string :sub_total
      t.string :total_shipping
      t.string :delivery_fee
      t.string :total
      t.string :country
      t.string :state
      t.string :city
      t.string :district
      t.string :street
      t.string :complement
      t.string :latitude
      t.string :longitude
      t.string :dt_order_create
      t.string :postal_code
      t.string :number
      t.references :customer, index: true, foreign_key: true

      t.timestamps
    end
  end
end
