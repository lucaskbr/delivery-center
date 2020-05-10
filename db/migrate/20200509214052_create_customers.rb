class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :external_code
      t.string :name
      t.string :email
      t.string :contact

      t.timestamps
    end
  end
end
