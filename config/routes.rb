Rails.application.routes.draw do
  resources :drummers do
    resources :drums, only: [:new, :create]
  end
end
