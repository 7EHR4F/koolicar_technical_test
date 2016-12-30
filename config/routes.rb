Rails.application.routes.draw do
  root to: 'events#index'
  get 'events/index'

  mount ActionCable.server => '/cable'
  match  '/rentals/index' => 'rentals#index', via: [:get]
  match '/rentals/new' => 'rentals#new', via: [:get]
  match '/rentals/parse_locations' => 'rentals#parse_locations', via: [:post]
end
