Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'root#index'
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  get '/welcome/:first_name', to: 'welcome#user', as: 'welcome'
  get '/gossip/:id', to: 'gossip#display', as: 'gossip'
  get '/user/:id', to: 'user#display', as: 'user'
end
