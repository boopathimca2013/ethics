Rails.application.routes.draw do
  get 'websites/index' => 'websites#index'
  get 'websites/show' => 'websites#show'
  get 'websites/new' => 'websites#new'
  get 'websites/edit' => 'websites#edit'
  post 'websites/create' => 'websites#create'
  get 'websites/update' => 'websites#update'
  root 'websites#index'
end