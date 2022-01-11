# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :find_storehouse, only: %i[index new create]

  def index
    @products = @storehouse.products
  end

  def new
    @product = @storehouse.products.new
  end

  def create
    @product = @storehouse.products.new(permitted_params)

    if @product.save
      redirect_to storehouse_products_path
    else
      head :unprocessable_entity
    end
  end

  private

  def find_storehouse
    @storehouse = Storehouse.find_by(params[:storehouse_id])
  end

  def permitted_params
    params.require(:product).permit(:name)
  end
end
