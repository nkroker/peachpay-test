Rails.application.routes.draw do
  root 'conversions#index'

  resources :conversions, only: [:index] do
    collection do
      post :convert
    end
  end
end
