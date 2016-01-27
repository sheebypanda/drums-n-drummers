Rails.application.routes.draw do
  resources :drummers do
    resources :drums, only: [:new, :create, :index]
  end
end
