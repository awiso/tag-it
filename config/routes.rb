Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users, :controllers => { registrations: 'registrations' }

  # requests shows you all pending requests
  get 'requests', to: 'requests#index', as: 'requests'

  #confirmations confirms and declines requests
  patch 'confirmations', to: 'confirmations#update', as: 'update_booking'

  # my_walls not needed any more
  # get 'my_walls', to: 'owner_bookings#index', as: 'owner_bookings'
  get 'my_bookings', to: 'artist_bookings#index', as: 'artist_bookings'
  get 'bookings', to: 'owner_bookings#index', as: 'owner_bookings'

  resources :walls do
    #
    resources :bookings, only: [:index, :show, :create, :edit, :update]
    # bookings show, gives booking/s related to specific walls
    # bookings new, create new booking for specific wall
    #form for new booking of wall is on wall/:id/show
    #etc
  end

  resources :bookings, only: :destroy

  ## when logged in, get all my walls as owner
  # get 'my_walls', to: 'my_walls#walls', as: 'my_walls'
end
