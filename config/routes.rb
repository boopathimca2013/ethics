Rails.application.routes.draw do
  get 'websites/index' => 'websites#index'
  get 'websites/show' => 'websites#show'
  get 'websites/new' => 'websites#new'
  get 'websites/edit' => 'websites#edit'
  post 'websites/create' => 'websites#create'
  get 'websites/update' => 'websites#update'


  get 'users/index' => 'users/index'
  get 'users/new' => 'users/new'
  post 'users/create' => 'users/create'
  get 'users/show' => 'users/show'  
  get 'users/show_address' => 'users/show_address'

  root 'users#new'
end