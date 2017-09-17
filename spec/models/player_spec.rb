require 'rails_helper'

RSpec.describe Player, type: :model do

	before(:each) do
		@player = Player.create!(name: "Sibar Al-ani")
	end

	describe "creation" do
		it "can create a player" do
			expect(Player.all.count).to eq(1)
		end
	end

	describe "validations" do
		it "should not let a player be created without a name" do
			@player.name = nil
			expect(@player).to_not be_valid
		end
	end
end
