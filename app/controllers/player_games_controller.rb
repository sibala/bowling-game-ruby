class PlayerGamesController < ApplicationController
	def index
		@games = Game.all
	end
end
