Rails.application.routes.draw do
  devise_for :users
  mount Attachinary::Engine => "/attachinary"
  root to: "pages#dashboard", constraints: lambda { |r| r.env["warden"].authenticate? }
  root to: 'pages#home'
  get "/dashboard/", to: "pages#dashboard"
  get "/calendar/", to: "pages#calendar"
  resources :checkups, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end
end
