Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"

  get "/login", to: "pages#login"
  post "/login", to: "pages#create", as: "login_session"
  delete "/logout", to: "pages#destroy", as: "logout"

  get "/admin/dashboard", to: "admins#dashboard", as: "dashboard_path"

  # Teachers
  get "admin/teachers", to: "admins#teachers", as: "teachers"
  get "admin/teacher/new", to: "admins#new_teacher", as: "new_teacher"
  get "admin/teacher/:id/edit", to: "admins#edit_teacher", as: "edit_teacher"
  get "admin/teacher/:id", to: "admins#show_teacher", as: "show_teacher"
  post "admin/create_teacher", to: "admins#create_teacher", as: "create_teacher"
  delete "admin/teacher/:id", to: "admins#delete_teacher", as: "delete_teacher"
  patch "admin/teacher/:id", to: "admins#update_teacher", as: "update_teacher"

  # Students
  get "admin/students", to: "admins#students", as: "students"
  get "admin/student/new", to: "admins#new_student", as: "new_student"
  get "admin/student/:id/edit", to: "admins#edit_student", as: "edit_student"
  get "admin/student/:id", to: "admins#show_student", as: "show_student"
  post "admin/create_student", to: "admins#create_student", as: "create_student"
  delete "admin/student/:id", to: "admins#delete_student", as: "delete_student"
  patch "admin/student/:id", to: "admins#update_student", as: "update_student"

  # Subjects
  get "admin/subjects", to: "admins#subjects", as: "subjects"
  get "admin/subject/:id/edit", to: "admins#edit_subject", as: "edit_subject"
  get "admin/subject/new", to: "admins#new_subject", as: "new_subject"
  post "admin/create_subject", to: "admins#create_subject", as: "create_subject"
  delete "admin/subject/:id", to: "admins#delete_subject", as: "delete_subject"
  patch "admin/subject/:id", to: "admins#update_subject", as: "update_subject"


end
