class Player < ApplicationRecord
	has_many :player_game
	has_many :game, through: :player_game

	validates_presence_of :name
end