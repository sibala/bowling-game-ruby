require 'rails_helper'

RSpec.describe GamesController, type: :controller do
	it "get new" do
		get :new
		expect(response.status).to eq(200)
	end

	# it "create a game" do 
	# 	game_params = FactoryGirl.attributes_for(:game)
	# 	expect{ post :create, :game => game_params }.to change(Game, :count).by(1) 
	# end

end
