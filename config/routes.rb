ThirstyHipster::Application.routes.draw do
  root to: 'searches#index'
  devise_for :users
  resources :locations do
    resources :comments
  end
  resources :comments
  resources :searches
end


