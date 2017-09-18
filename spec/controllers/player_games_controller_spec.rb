require 'rails_helper'

RSpec.describe PlayerGamesController, type: :controller do
	it "get index" do
		get :index
		expect(response.status).to eq(302)
	end
end
