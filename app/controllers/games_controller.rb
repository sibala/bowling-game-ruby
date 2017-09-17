class GamesController < ApplicationController
	def index
		@games = Game.all
	end

	def new
		@game = Game.new
	end

	def create
		@player1 = Player.new(name: params[:player_name1])
		@player2 = Player.new(name: params[:player_name2])
		@game = Game.new

		if @player1.save && @player2.save && @game.save
			session[:player1] = @player1.id
			session[:player2] = @player2.id
			session[:game] = @game.id

			redirect_to player_games_url
		else 
			flash[:notice] = "Bägge spelar-namnen krävs för att starta spelet" 
			redirect_to new_game_url
		end
	end
end
