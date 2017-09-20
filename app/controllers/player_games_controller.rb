class PlayerGamesController < ApplicationController
	attr_reader :player1, :player2, :game, :player_turn, :rolls
	before_action :require_session

	def require_session 
		# reset_session
		# session.delete(:player1)
		if !session[:player1] || !session[:player2] || !session[:game]
			redirect_to root_path
		end

		@player1 = session[:player1]
		@player2 = session[:player2]
		@game = session[:game]
		@rolls = []
	end


	def index
		@playerGames1 = PlayerGame.where(:player_id => @player1).where(:game_id => @game).order('id').to_a
		@playerGames2 = PlayerGame.where(:player_id => @player2).where(:game_id => @game).order('id').to_a
	end


	def roll fallenPins = 0
		a = 0;
		b = 10 - fallenPins

		pins = rand(a..b)
		# pins = 10
		@rolls << pins
	end
	

	def create 
		player_turn
		frameCount = PlayerGame.where(:player_id => @player_turn).where(:game_id => @game).count(:id) + 1
		if !frameCount.present?
			frameCount = 1
		end

		if frameCount > 10
			# abort frameCount.inspect
			redirect_to player_games_url
			return
		end
		
		if frameCount != 10
			roll
			
			if @rolls.last != 10
				roll(@rolls.last)
			end
		else
			tenthFrame
		end
		# abort @rolls.inspect
		# @rolls = [3, 3]
		@playerGame = PlayerGame.new
		@playerGame.score(@player_turn, @game, frameCount, @rolls)
		# render :text => @rolls.inspect
		redirect_to player_games_url
	end


	def tenthFrame
		roll

		if @rolls.last == 10
			roll

			if @rolls.last < 10
				roll(@rolls.last)
			else
				roll
			end
			return
		end

		roll(@rolls.last)
		if @rolls.last(2).reduce(:+) == 10
			roll
		end
	end


	def player_turn
		if session[:playerTurn] == 1
			@player_turn = session[:player1]
			session[:playerTurn] = 0
		else
			@player_turn = session[:player2]
			session[:playerTurn] = 1
		end
	end


	def reset
		# reset_session
		PlayerGame.where(:player_id => @player1).where(:game_id => @game).destroy_all
		PlayerGame.where(:player_id => @player2).where(:game_id => @game).destroy_all
		session[:playerTurn] = 1
		redirect_to request.referer
	end
end

