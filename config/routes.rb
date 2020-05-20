Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do

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
