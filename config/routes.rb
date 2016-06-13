Rails.application.routes.draw do
  root to: redirect(Setting.where(key: "homepage").first.value)

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  devise_scope :user do
    get "admin" => "devise/sessions#create"
  end
  resources :pages, only: [:show]
  resources :categories, only: [:show]
  namespace :admin do
    resources :menus, exclude: [:show]
    resources :types, exclude: [:show]
    resources :pages
    resources :categories
    resources :users
    get "settings" => "settings#index"
    put "settings" => "settings#update"
  end

  Page.where.not("slug", nil).all.each do | page |
    get (page.slug.present?) ? "/#{page.slug}" : "/pages/#{page.id}", controller: "pages", action: "show", id: page.id
  end
end
