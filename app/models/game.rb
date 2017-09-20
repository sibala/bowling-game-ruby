class Game < ApplicationRecord
	has_many :player_game
	has_many :player, through: :player_game
end
