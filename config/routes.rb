Rails.application.routes.draw do

   root to: 'tests#index'

   resources :tests do
      resources :questions
   end



   # /tests/backend/ruby
   # get '/tests/:category/:title', to: 'tests#search', level: 2

   #
   # namespace :admin do
   #    resources :articles, :comments
   # end

   #resource :geocoder
   #resolve('Geocoder') { [:geocoder] }


   # get 'profile', action: :show, to: 'users#'
  # get 'profile', action: :show, controller: 'users'

  # get 'profile', to: 'users#show'
  # get '/profile', to: 'users#show'

  # get '/patients/:id', to: 'patients#show' , as: 'patient'



   # установим корневой маршрут на страницу about.html
   # root 'application#hello'

   # resources :tests

   # resource :account

   # resource :account, controller: :account

   # resources :accounts, only: %i[index show]

   # resources :tests do
   #   resources :questions
   # end

   # resources :tests do
   #   resources :questions, shallow: true
   # end

   # GET /tests/beginner
   # POST /tests/1/start

   # resources :tests do
   #   get :beginer, on: :collection
   #
   #   member do
   #     post :start
   #   end
   # end

   # get '/tests', to: 'tests#index'

   # get '/tests/:id', to: 'tests#show', as: :test

   # get '/tests(/:id)', to: 'tests#show'

   # get '/tests/:id/start', to: 'tests#start'

   # get '/tests/:id/start', to: 'tasks#start'

   # match '/tests/:id', to: 'tests#create', via: %i[post put]

   # match '/tests/:id', to: 'tests#create', via: :all

end
