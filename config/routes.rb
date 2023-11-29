Rails.application.routes.draw do
  match '/login', to: "page#login", via: [:get, :post]
  match '/otp', to: "page#otp", via: [:get, :post]
  match '/add_otp', to: "page#add_otp", via: [:get, :post]
  get '/logout', to: "auth#logout"
  get '/render_qr', to: "auth#qr"
  get "up" => "rails/health#show", as: :rails_health_check
  root "page#index"
end
