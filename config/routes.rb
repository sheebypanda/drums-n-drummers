Rails.application.routes.draw do
  resources :drummers do
    resources :drums, only: [:new, :create, :index, :destroy, :show]
  end
  resources :drums
end
