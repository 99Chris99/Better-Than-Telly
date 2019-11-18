Rails.application.routes.draw do
  root 'events#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  #resources :event_reviews
  # resources :event_attendees
  post '/event_attendees_path/:id', to: 'event_attendees#create', as: 'attend_event'
  post '/event_attendees_path/:id', to: 'event_attendees#destroy', as: 'cancel_attendance'

  resources :events
  resources :venues
  resources :categories
  resources :reviews
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end



#get '/reviews/:id/new', to: 'reviews#new'