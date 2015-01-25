Rails.application.routes.draw do

  resources :events do
    member do
      post 'close'
    end
  end

  resources :movies

  devise_for :users, controllers: { registrations: :registrations }

  root 'application#index'

  get 'admin' => 'admin#index'
  get 'users' => 'admin#users'
  get 'user/:id' => 'admin#user'

  get 'invite' => 'invitation#index'
  post 'invite/email' => 'invitation#for_email'
  get 'invite/link' => 'invitation#generate_link'

  resources :votes, only: [:index, :create, :destroy] do
    member do
      post :up, :down
    end
  end
end
