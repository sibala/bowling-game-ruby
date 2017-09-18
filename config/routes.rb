Rails.application.routes.draw do
	# resources :games
	# resources :player_games

	root 'games#new'
	get '/games/new', to: 'games#new'
	post '/games', to: 'games#create'

	get '/player_games', to: 'player_games#index'
	post '/player_games', to: 'player_games#create'
	get '/reset', to: 'player_games#reset'
end