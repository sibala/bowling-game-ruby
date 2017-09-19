require "rails_helper"

RSpec.feature "create players" do
	scenario "allow to create a player" do
		visit root_url
		fill_in "Spelare 1", with: "Sibar Al-ani"
		fill_in "Spelare 2", with: "John Doe"

		click_on("Starta Spelet")

		expect(page).to have_content("Sibar Al-ani")
		expect(page).to have_content("John Doe")
	end
end