# frozen_string_literal: true

# Общепринятый нейминг для связей many-to-many здесь ради того, чтобы показать :) Так бы я по-другому назвал
class ProductsStorehouse < ApplicationRecord
  belongs_to :source_storehouse, class_name: 'Storehouse'
  belongs_to :target_storehouse, class_name: 'Storehouse'

  has_many :exchange_histories, dependent: :destroy, inverse_of: 'products_storehouse'

  validates :exchange_histories, length: { minimum: 1 }

  def process_products(products: {})
    products.each do |id, amount|
      ActiveRecord::Base.transaction do
        product = source_storehouse.products.find_by(id: id.to_i)
        next if product.amount < amount['amount'].to_i || amount['amount'].to_i.zero?

        product.amount -= amount['amount'].to_i
        target_product = target_storehouse.products.find_by(name: product.name) ||
                         target_storehouse.products.new(name: product.name)
        target_product.amount += amount['amount'].to_i
        history = exchange_histories.new(product_id: id.to_i, amount: amount['amount'])
        history.save
        target_product.save
        product.save
      end
    end
  end
end
