Rails.application.routes.draw do
  scope '/admin' do
    resources :drummers do
      resources :drums, only: [:new, :create, :index, :destroy, :show]
    end
    resources :drums
  end

  get '/', to: 'games#welcome'
  get '/about', to: 'games#about'
  get '/play', to: 'games#play'
  get '/check', to: 'games#welcome'
  post '/check', to: 'games#check'
  get '/loose', to: 'games#loose'

  get '/admin', to: 'drummers#index'
  root 'games#welcome'

end
