Rails.application.routes.draw do

  resources :subjects do
    member do
      get :delete
    end
  end

  root 'home#index'

  get 'home/about'
  get 'home/other_index'
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
