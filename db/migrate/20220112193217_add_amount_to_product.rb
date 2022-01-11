class AddAmountToProduct < ActiveRecord::Migration[6.0]
  def up
    add_column :products, :amount, :integer, default: 0
  end

  def down
    remove_column :products, :amount
  end
end
