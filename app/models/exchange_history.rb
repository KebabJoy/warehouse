# frozen_string_literal: true

class ExchangeHistory < ApplicationRecord
  belongs_to :products_storehouse
  belongs_to :product
end
