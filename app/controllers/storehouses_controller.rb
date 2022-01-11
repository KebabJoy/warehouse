# frozen_string_literal: true

class StorehousesController < ApplicationController
  def index
    @storehouses = Storehouse.all
  end

  def new
    @storehouse = Storehouse.new
  end

  def create
    @storehouse = Storehouse.new(permitted_params)

    if @storehouse.save
      redirect_to storehouses_path
    else
      head :unprocessable_entity
    end
  end

  private

  def permitted_params
    params.require(:storehouse).permit(:name)
  end
end
