Rails.application.routes.draw do
  namespace :admin do
    root to: "drummer#index"
    get '/', to: 'drummers#index'
    resources :drummers do
      resources :drums, only: [:new, :create, :index, :destroy, :show]
    end
    resources :drums
  end
end
