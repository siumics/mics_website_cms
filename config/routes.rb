Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  resources :pages, only: [:show]
  resources :categories, only: [:show]
  namespace :admin do
    resources :pages
    resources :categories
  end

  Page.where.not("slug", nil).all.each do | page |
    get (page.slug.present?) ? "/#{page.slug}" : "/pages/#{page.id}", controller: "pages", action: "show", id: page.id
  end

  root 'admin/pages#index'
end
