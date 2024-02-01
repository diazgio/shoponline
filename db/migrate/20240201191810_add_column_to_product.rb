class AddColumnToProduct < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :stock, :integer, default: 0
  end
end
