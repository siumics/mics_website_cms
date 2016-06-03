Rails.application.routes.draw do
  devise_for :users
  resources :pages, only: [:show]
  resources :categories, only: [:show]
  namespace :admin do
    resources :pages
    resources :categories
  end

  Page.where.not("slug", nil).all.each do | page |
    get "/#{page.slug}", controller: "pages", action: "show", id: page.id
  end

  root 'admin/pages#index'
end
