Rails.application.routes.draw do
  devise_for :users
  root to: "pages#dashboard", constraints: lambda { |r| r.env["warden"].authenticate? }
  root to: 'pages#home'
  get "/dashboard/", to: "pages#dashboard"
  get "/calendar/", to: "pages#calendar"
end
