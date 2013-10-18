RedditClone::Application.routes.draw do
  resources :users
  resource :session
  resources :subs
  resources :links do
    resources :comments, only: [:new, :create]
  end
  resources :comments, except: [:new, :create]

end
