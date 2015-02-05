Rails.application.routes.draw do

  default_url_options Rails.application.config.action_mailer.default_url_options

  resources :events do
    member do
      post 'close'
    end
  end

  resources :movies

  devise_for :users, controllers: { registrations: :registrations }

  root 'application#index'

  get 'admin' => 'application#admin'

  resources :users, only: [:index, :show, :destroy]

  get 'invite' => 'invitation#index'
  post 'invite/email' => 'invitation#for_email'
  get 'invite/link' => 'invitation#generate_link'

  resources :votes, only: [:index, :create, :destroy] do
    member do
      post :up, :down
    end
  end
end
