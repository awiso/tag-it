Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users do
  end


  get 'owner_bookings', to: 'owner_bookings#index', as: 'owner_bookings'
  get 'my_bookings', to: 'artist_bookings#index', as: 'artist_bookings'

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
  get 'my_walls', to: 'my_walls#walls', as: 'my_walls'
end
