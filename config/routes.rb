Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
      end

      namespace :items do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
      end

      resources :merchants, except: [:new, :edit] do
        scope module: :merchants do
          resources :items
        end
      end

      resources :items, except: [:new, :edit] do
        scope module: :items do
          resources :merchant
        end
      end
      resources :customers, except: [:new, :edit]

    end
  end
end
