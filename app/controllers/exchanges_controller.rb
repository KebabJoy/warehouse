# frozen_string_literal: true

class ExchangesController < ApplicationController
  def index
    @exchanges = ProductsStorehouse.all
  end

  def new
    @exchange = ProductsStorehouse.new
  end

  def create
    @exchange = ProductsStorehouse.new(permitted_params)

    if @exchange.save
      redirect_to exchanges_path
    else
      head :unprocessable_entity
    end
  end

  def prepare_products
    @exchange = ProductsStorehouse.new(prepare_params)
  end

  private

  def prepare_params
    params.require(:products_storehouse).permit(:source_storehouse_id, :target_storehouse_id)
  end

  def permitted_params
    params.require(:products_storehouse).permit(:product_id, :amount)
  end
end
