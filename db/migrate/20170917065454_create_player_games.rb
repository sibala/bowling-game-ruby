class CreatePlayerGames < ActiveRecord::Migration[5.1]
  def change
    create_table :player_games do |t|
      	t.timestamps
    end
  end
end
