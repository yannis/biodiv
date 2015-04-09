Rails.application.routes.draw do

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope "(:locale)", locale: /fr|en/ do |locale|
    get 'home/index'
    root 'home#index'
    resources :projects, only: [:index, :show]
  end
end
