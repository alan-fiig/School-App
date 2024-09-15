Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"

  get "/login", to: "pages#login"
  post "/login", to: "pages#create", as: "login_session"
  delete "/logout", to: "pages#destroy", as: "logout"

  namespace :admin do
    get "dashboard", to: "dashboards#dashboard"

    resources :students do
      get "dashboard", on: :collection
    end
    resources :teachers do
      get "dashboard", on: :collection
    end
    resources :subjects, except: :show
  end
end
