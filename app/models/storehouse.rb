# frozen_string_literal: true

class Storehouse < ApplicationRecord
  has_many :products, dependent: :destroy
end
