Rails.application.routes.draw do
  root 'controll_center#index'

  controller :controll_center do
    get 'controll_center/index', action: 'index'
  end

  resources :dams, only: [:index, :show] do
    resource :fav, only: :create
    get :map, to: 'dams#map', on: :member
  end
  scope 'river_system/:river_system_id' do
    resources :dams, only: [:index, :show]
  end

  namespace :admin do
    resources :dams do
      resource  :reservoir
      resources :discharge_facilities
      get :export, to: 'dams#export', on: :collection
    end

    # 以下8行は "resources :dams" と等価
    # get    'dams',          to: 'dams#index' , as: :dams
    # post   'dams',          to: 'dams#create'
    # get    'dams/new',      to: 'dams#new',    as: :new_dam
    # get    'dams/:id/edit', to: 'dams#edit',   as: :edit_dam
    # get    'dams/:id',      to: 'dams#show',   as: :dam
    # match  'dams/:id',      to: 'dams#update', via: [:patch, :put]
    # delete 'dams/:id',      to: 'dams#destroy'
  end
end
