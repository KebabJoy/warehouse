class CreateProductsStorehouses < ActiveRecord::Migration[6.0]
  def change
    create_table :products_storehouses do |t|
      t.references :source_storehouse, :target_storehouse, :product
      t.integer :amount

      t.timestamps
    end
  end
end
