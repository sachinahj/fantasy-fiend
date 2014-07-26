class CreateStatForDs < ActiveRecord::Migration
  def change
    create_table :stat_for_ds do |t|
      t.references :player, index: true

      t.integer :games_played
      t.float :points_per_game
      t.float :yards_per_game
      t.float :rush_yards_per_game
      t.float :pass_yards_per_game
      t.integer :interceptions
      t.integer :interceptions_for_touchdowns
      t.integer :forced_fumbles
      t.integer :defense_touchdowns
      t.integer :tackles
      t.integer :pass_defended
      t.integer :sacks

      t.timestamps
    end
  end
end
