Rails.application.routes.draw do

  get "/", to: "welcome#index", as: :root

  get "/user/new", to: "user#new", as: :new_user
  post "/user/new", to: "user#create",as: false
  get "/user/edit", to: "user#edit", as: :edit_user
  patch "/user/edit", to: "user#update", as: false

  get "/login", to: "login#new", as: :new_login
  post "/login", to: "login#create", as: false
  get "/login/destroy", to: "login#destroy", as: :destroy_login

  get "/ideas", to: "ideas#index", as: :ideas
  get "/ideas/new", to: "ideas#new", as: :new_idea
  post "/ideas/new", to: "ideas#create", as: false
  get "/ideas/:id", to: "ideas#show", as: :show_idea
  get "/ideas/edit/:id", to: "ideas#edit", as: :edit_idea
  patch "/ideas/edit/:id", to: "ideas#update", as: false
  get "/ideas/destroy/:id", to: "ideas#destroy", as: :destroy_idea
  post "/ideas/:id", to: "ideas#new_comment", as: false
end
