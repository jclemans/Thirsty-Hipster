ThirstyHipster::Application.routes.draw do
  root to: 'locations#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :locations do
    resources :comments
  end
  resources :comments
end


