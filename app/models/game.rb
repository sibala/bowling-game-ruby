class Game < ApplicationRecord
	has_many :player_game
	has_many :player, through: :player_game

	def new
		@player = Player.new
		# @game = Game.new
	end
end
