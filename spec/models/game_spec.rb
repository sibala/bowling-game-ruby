require 'rails_helper'

RSpec.describe Game, type: :model do
	# it "can create a game" do
	# 	game = Game.new
	# end
	
	before(:each) do
		@game = Game.create()
	end

	describe "creation" do
		it "can create a game" do
			expect(Game.all.count).to eq(1)
		end
	end

	
end