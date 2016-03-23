Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/auth/:provider/callback' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout

  resources :events, except: [:index] do
    resources :tickets, only: [:new, :create, :destroy]
  end

  resources :users, only: [:destroy] do
    get :retire
  end

  # Catch paths that don't match any paths above
  # (and store them as 'params[:path]').
  match '*path' => 'application#error404', via: :all
end
