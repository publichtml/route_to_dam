Rails.application.routes.draw do
  resources :dams

  # 以下8行は "resources :dams" と等価
  # get    'dams',          to: 'dams#index'
  # post   'dams',          to: 'dams#create'
  # get    'dams/new',      to: 'dams#new',   as: :new_dam
  # get    'dams/:id/edit', to: 'dams#edit',  as: :edit_dam
  # get    'dams/:id',      to: 'dams#show',  as: :dam
  # patch  'dams/:id',      to: 'dams#update'
  # put    'dams/:id',      to: 'dams#update' # deprecated
  # delete 'dams/:id',      to: 'dams#destroy'
end
