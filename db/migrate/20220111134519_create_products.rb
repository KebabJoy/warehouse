class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :storehouse
      t.string :name

      t.timestamps null: false
    end

    add_index :products, [:storehouse_id, :name], unique: true
  end
end
