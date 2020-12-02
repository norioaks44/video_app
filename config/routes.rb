Rails.application.routes.draw do
  root "videos#index"
  resources :videos do
    collection do
      get 'search'
    end
  end
end
