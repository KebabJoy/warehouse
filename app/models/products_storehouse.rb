# frozen_string_literal: true

class ProductsStorehouse < ApplicationRecord
  belongs_to :source_storehouse, class_name: 'Storehouse'
  belongs_to :target_storehouse, class_name: 'Storehouse'
  belongs_to :product
end
