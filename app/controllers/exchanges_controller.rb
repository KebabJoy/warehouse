# frozen_string_literal: true

class ExchangesController < ApplicationController
  def index
    @exchanges = ProductsStorehouse.includes(:exchange_histories)
  end

  def new
    @exchange = ProductsStorehouse.new
  end

  def create
    @exchange = ProductsStorehouse.new(permitted_params[:storehouse])
    @exchange.process_products(products: permitted_params[:products])

    if @exchange.save
      redirect_to exchanges_path
    else
      head :unprocessable_entity
    end
  end

  def prepare_products
    @exchange = Storehouse.where(
      id: [prepare_params[:source_storehouse_id], prepare_params[:target_storehouse_id]]
    )
  end

  private

  def prepare_params
    params.require(:products_storehouse).permit(:source_storehouse_id, :target_storehouse_id)
  end

  def permitted_params
    {}.tap do |hash|
      hash[:storehouse] = params.require(:storehouse).permit(:source_storehouse_id, :target_storehouse_id)
      hash[:products] = params.require(:products).permit!
    end
  end
end
