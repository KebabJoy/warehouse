# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'storehouses#index'

  resources :storehouses, only: %i[index new create] do
    resources :products, only: %i[index new create destroy]
  end

  resources :exchanges, only: %i[index new create] do
    collection do
      post :prepare_products
    end
  end
end
