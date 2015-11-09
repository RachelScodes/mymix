Rails.application.routes.draw do

   root 'welcome#index'

   get '/login' => 'sessions#new'
   post '/login' => 'sessions#create'
   get '/logout' => 'sessions#destroy' #, as: 'logout'

   get '/signup' => 'users#new' #, as: 'signup'
   post '/users' => 'users#create'

   resources :users

   resources :mixtapes do
      member do
         post 'record_song'
         get 'erase_song'
      end
   end

   resources :songs

end
