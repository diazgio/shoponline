class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions, id: :uuid do |t|
      t.references :product, null: false, foreign_key: true, type: :uuid
      t.references :seller, null: false, foreign_key: { to_table: :users }, type: :uuid
      t.references :buyer, null: false, foreign_key: { to_table: :users }, type: :uuid
      t.text :delivery_address, null: false
      t.integer :quantity, null: false
      t.integer :billing_status, null: false, default: 0

      t.timestamps
    end
  end
end
