Rails.application.routes.draw do
  root 'users#index'

  resources :users do
  	resources :address
  end

end
