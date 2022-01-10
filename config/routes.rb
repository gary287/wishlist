Rails.application.routes.draw do
  root 'lists#new'
  resources :lists, except: %i[index show] do
    resources :items, except: :show
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
