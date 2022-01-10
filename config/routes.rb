Rails.application.routes.draw do
  root 'lists#new'
  resources :lists, except: :index do
    resources :items
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
