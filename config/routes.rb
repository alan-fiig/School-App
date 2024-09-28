Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"

  get "/login", to: "pages#login"
  post "/login", to: "pages#create", as: "login_session"
  delete "/logout", to: "pages#destroy", as: "logout"

  namespace :admin do
    get "dashboard", to: "dashboards#dashboard"

    resources :students
    resources :teachers
    resources :subjects, except: :show
    resources :teacher_subjects, except: :show
  end

  namespace :teacher do
    get "dashboard", to: "dashboards#dashboard"
  end

  namespace :student do
    get "dashboard", to: "dashboards#dashboard"
  end
end
