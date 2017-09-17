class AddThreeRollsToPlayerGame < ActiveRecord::Migration[5.1]
  def change
		add_column :player_games, :roll1, :integer
		add_column :player_games, :roll2, :integer
		add_column :player_games, :roll3, :integer
  end
end
