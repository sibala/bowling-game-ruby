class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
		t.string :winner
		t.integer :winner_score
		t.timestamps
    end
  end
end
