class PlayerGame < ApplicationRecord
	belongs_to :player
	belongs_to :game
	# attr_reader :rolls

	# def initialize
	# 	@rolls = []
	# end

	# def roll fallenPins = 0
	# 	a = 0;
	# 	b = 10 - fallenPins

	# 	pins = rand(a..b)
	# 	@rolls << pins
	# end

	def score playerId, gameId, frameCount, rolls
		frameScore = 0
		totFrameScore = 0

		lastFrame = PlayerGame.where(:player_id => playerId).where(:game_id => gameId).lastPlayerGame
		secondLastFrame = PlayerGame.where(:player_id => playerId).where(:game_id => gameId).secondLastPlayerGame
		
		lastFrameScore = PlayerGame.where(:player_id => playerId).where(:game_id => gameId).where.not(:frame_score => nil ).lastPlayerGame
		if lastFrameScore.present?
			totFrameScore += lastFrameScore.frame_score
		end

		rolls.each do |roll|
			frameScore += roll
		end

		if secondLastFrame.present? && secondLastFrame.frame_score.blank?
			if secondLastFrame.strike?
				totFrameScore += 10 + 10 + rolls[0]
				secondLastFrame.frame_score = totFrameScore
				secondLastFrame.save
			end
		end
		
		if lastFrame.present? && lastFrame.frame_score.blank?
			if lastFrame.strike? 
				if rolls[0] != 10 # if NOT 2 strikes in a row
					totFrameScore += 10 + strikeBonus(rolls)
					lastFrame.frame_score = totFrameScore
					lastFrame.save
				end
			elsif lastFrame.spare? 
				totFrameScore += 10 + spareBonus(rolls)
				lastFrame.frame_score = totFrameScore
				lastFrame.save
			end
		end


		totFrameScore += frameScore
		playerGame = PlayerGame.new
		playerGame.player_id = playerId 
		playerGame.game_id = gameId
		playerGame.roll1 = rolls[0]

		if frameCount == 10
			if strike? rolls
				if rolls[1] == 10
					lastFrame.frame_score = totFrameScore
					lastFrame.save
					totFrameScore += 10 + strikeBonus(rolls)
				end

				playerGame.frame_score = totFrameScore # + rolls[0] + rolls[1] + rolls[2]
				playerGame.roll2 = rolls[1]
				playerGame.roll3 = rolls[2]

			elsif spare? rolls
				playerGame.frame_score = totFrameScore # + rolls[0] + rolls[1] + rolls[2]
				playerGame.roll2 = rolls[1]
				playerGame.roll3 = rolls[2]
			else
				playerGame.frame_score = totFrameScore
				playerGame.roll2 = rolls[1]	
			end
		else
			if !strike? rolls
				if spare? rolls
					playerGame.roll2 = rolls[1]
				else
					playerGame.frame_score = totFrameScore
					playerGame.roll2 = rolls[1]	
				end
			end
		end
		playerGame.save

	end

	def self.lastPlayerGame
		order("id DESC").limit(1).first
	end

	def self.secondLastPlayerGame
		order("id DESC").offset(1).limit(1).first
	end
	
	def strike? rolls = 0
		if rolls.is_a? Array
			rolls[0] == 10
		else
			self.roll1 == 10
		end
	end

	def strikeBonus rolls
		rolls[0] + rolls[1]
	end

	def spare? rolls = 0
		if rolls.is_a? Array
			rolls[0] + rolls[1] == 10
		else
			self.roll1 + self.roll2 == 10
		end
	end

	def spareBonus rolls
		rolls[0]
	end

	def self.scoreToSign score
		if score == 10
			score.to_s.sub('10', "X")
		elsif score == 0
			score.to_s.sub('0', "-")
		else
			score.to_s
		end
	end
end