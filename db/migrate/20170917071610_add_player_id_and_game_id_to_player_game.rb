class AddPlayerIdAndGameIdToPlayerGame < ActiveRecord::Migration[5.1]
  def change
	  	add_column :player_games, :player_id, :integer
	  	add_column :player_games, :game_id, :integer
	  	add_column :player_games, :frame_score, :integer
  end
end
