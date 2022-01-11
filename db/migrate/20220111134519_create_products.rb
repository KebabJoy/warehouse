class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :storehouse
      t.string :name, index: { unique: true }

      t.timestamps null: false
    end
  end
end
