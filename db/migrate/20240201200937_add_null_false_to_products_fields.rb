class AddNullFalseToProductsFields < ActiveRecord::Migration[7.1]
  def change
    change_column_null :products, :title, false
    change_column_null :products, :price, false
    change_column_null :products, :description, false
  end
end
