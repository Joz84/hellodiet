Rails.application.routes.draw do
  devise_for :users
  mount Attachinary::Engine => "/attachinary"
  root to: "pages#dashboard", constraints: lambda { |r| r.env["warden"].authenticate? }
  root to: 'pages#home'
  # get "/dashboard/", to: "pages#dashboard"
  get "/video/", to: "pages#video"
  get "/calendar/", to: "pages#calendar"
  get "/localisation/", to: "checkups#localisation"
  post "/localisation/", to: "checkups#create_with_localisation"
  resources :checkups, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end
end
