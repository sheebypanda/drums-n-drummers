Rails.application.routes.draw do
  get '/', to: 'drummers#index'
  resources :drummers do
    resources :drums, only: [:new, :create, :index, :destroy, :show]
  end
  resources :drums
end
