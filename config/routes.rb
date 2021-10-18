Rails.application.routes.draw do

  resources :answers
   root to: 'tests#index'

   resources :tests do
      resources :questions, shallow: true, except: [:index]
   end

end
