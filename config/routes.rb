Rails.application.routes.draw do
  get "no_role", to: "static_pages#home"

  devise_for :users

  root "admin/m_folks#index"
  namespace :admin do
    root "m_folks#index"
    resources :m_folks
    resources :folk_translations
    resources :categories, except: :show do
      resources :words, except: [:show]
      resources :sentences, except: [:show]
      resources :questions, except: [:show]
    end
  end

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :m_folks, only: [:index, :show]
      resources :categories, only: [:index, :show] do
        resources :lessons, only: :show
      end
    end
  end
end
