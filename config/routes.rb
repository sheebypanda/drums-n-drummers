Rails.application.routes.draw do
  scope '/admin' do
    resources :drummers do
      resources :drums, only: [:new, :create, :index, :destroy, :show]
    end
    resources :drums
  end

  get '/', to: 'drummers#welcome'
  get '/play', to: 'drummers#play'
  get '/check', to: 'drummers#welcome'
  post '/check', to: 'drummers#check'
  get '/loose', to: 'drummers#loose'

  get '/admin', to: 'drummers#index'
  root 'drummers#welcome'

end
