Rails.application.routes.draw do
  root 'lists#new'
  resources :lists, except: %i[index show] do
    resources :items, except: :show
  end

  get 'lists/shared/:shared_id/items', to: 'shared_items#index', as: 'shared_items'
  patch 'lists/shared/:shared_id/items/:id', to: 'shared_items#purchase',
                                             as: 'purchase_shared_item'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
