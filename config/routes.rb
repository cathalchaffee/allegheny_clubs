Rails.application.routes.draw do

  # CREATE ROOT PATH  
  root 'welcome#index'

  # club Resource
  resources :clubs do
    member do
      get 'about'
      get 'club_topics'
    end
  end

  # topics belong to a club
  resources :topics
  
  # comments belong to a topic
  resources :comments
  
  # session routes
  get    'login'     => 'sessions#new'
  post   'login'     => 'sessions#create'
  delete 'logout'    => 'sessions#destroy'
  
  # user routes
  resources :users
  get    'signup'    => 'users#new'
  post   'join_club' => 'users#show'
  
end
