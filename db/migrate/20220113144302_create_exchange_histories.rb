class CreateExchangeHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :exchange_histories do |t|
      t.references :product, :products_storehouse
      t.integer :amount, null: false

      t.timestamps
    end
  end
end
