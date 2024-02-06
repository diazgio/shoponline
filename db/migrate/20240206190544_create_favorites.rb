class CreateFavorites < ActiveRecord::Migration[7.1]
  def change
    create_table :favorites, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :product, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
    # evitar que un usuario pueda tener el mismo producto como favorito más de una vez
    add_index :favorites, [:user_id, :product_id], unique: true
  end
end
