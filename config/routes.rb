Rails.application.routes.draw do
  scope '/admin' do
    resources :drummers do
      resources :drums, only: [:new, :create, :index, :destroy, :show]
    end
    resources :drums
  end

  get '/', to: 'drummers#welcome'
  get '/play', to: 'drummers#play'
  post '/check', to: 'drummers#check'

end
