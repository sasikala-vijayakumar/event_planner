Rails.application.routes.draw do
  resources :parties do
    resources :attendees, only: [ :create, :destroy ]
  end

  root "parties#index"
  get "/manifest.json", to: "rails/pwa#manifest"
end
