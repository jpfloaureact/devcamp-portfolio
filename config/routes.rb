Rails.application.routes.draw do
  
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  resources :portfolios, except: [:show]

  get 'angular-items', to: 'portfolios#angular'

  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'about_me', to: 'pages#about'

  get 'contact', to: 'pages#contact'
  
  resources :blogs
  
  root to: 'pages#home'

end
