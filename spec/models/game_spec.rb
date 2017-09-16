require 'rails_helper'

RSpec.describe Game, type: :model do
	before do
		@game = Game.new
	end

	it "can roll gutter game" do
		20.times{@game.roll(0)}
		expect(@game.score).to eq(0)
	end

	it "can roll all one" do
		20.times{@game.roll(1)}
		expect(@game.score).to eq(20)
	end

	it "can roll a spare" do
		@game.roll(5)
		@game.roll(5)
		@game.roll(3)
		17.times{@game.roll(0)}
		expect(@game.score).to eq(16)
	end

	it "can roll a strike" do
		@game.roll(10)
		@game.roll(6)
		@game.roll(3)
		16.times{@game.roll(0)}
		expect(@game.score).to eq(28)
	end

	it "can roll a perfect game" do
		12.times{@game.roll(10)}
		expect(@game.score).to eq(300)
	end
end
