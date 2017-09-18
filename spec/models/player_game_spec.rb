require 'rails_helper'

RSpec.describe PlayerGame, type: :model do
	before do
		@playerGame = PlayerGame.new
	end

 #  	it "can roll gutter game" do
	# 	20.times{@playerGame.roll(0)}
	# 	expect(@playerGame.score).to eq(0)
	# end

	# it "can roll all one" do
	# 	20.times{@playerGame.roll(1)}
	# 	expect(@playerGame.score).to eq(20)
	# end

	# it "can roll a spare" do
	# 	@playerGame.roll(5)
	# 	@playerGame.roll(5)
	# 	@playerGame.roll(3)
	# 	17.times{@playerGame.roll(0)}
	# 	expect(@playerGame.score).to eq(16)
	# end

	# it "can roll a spare" do
	# 	@playerGame.roll(10)
	# 	@playerGame.roll(5)
	# 	@playerGame.roll(3)
	# 	16.times{@playerGame.roll(0)}
	# 	expect(@playerGame.score).to eq(26)
	# end

	# it "can roll all spares" do
	# 	21.times{@playerGame.roll(5)}
	# 	expect(@playerGame.score).to eq(150)
	# end

	# it "can roll all strikes" do
	# 	12.times{@playerGame.roll(10)}
	# 	expect(@playerGame.score).to eq(300)
	# end

	# private
	# def rollMany qty, value
	# 	qty.times{$game.roll(value)}
	# end
end
