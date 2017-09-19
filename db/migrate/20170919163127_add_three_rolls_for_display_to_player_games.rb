class AddThreeRollsForDisplayToPlayerGames < ActiveRecord::Migration[5.1]
  def change
	  	add_column :player_games, :display_roll1, :string
		add_column :player_games, :display_roll2, :string
		add_column :player_games, :display_roll3, :string
  end
end
