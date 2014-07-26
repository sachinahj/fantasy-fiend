class CreateStatForWrs < ActiveRecord::Migration
  def change
    create_table :stat_for_wrs do |t|
      t.references :player, index: true

      t.integer :games_played
      t.integer :receiving_completions
      t.integer :receiving_target
      t.integer :receiving_yards
      t.float :receiving_yards_per_game
      t.float :receiving_average_yards_per_completion
      t.integer :receiving_long
      t.float :receiving_yards_after_catch
      t.integer :receiving_first_downs
      t.integer :receiving_touchdowns
      t.integer :kick_return_attempts
      t.integer :kick_return_yards
      t.float :kick_return_yards_per_attempt
      t.integer :kick_return_long
      t.integer :kick_return_touchdowns
      t.integer :punt_return_attempts
      t.integer :punt_return_yards
      t.float :punt_return_yards_per_attempt
      t.integer :punt_return_long
      t.integer :punt_return_touchdowns
      t.integer :fumbles
      t.integer :fumbles_lost


      t.timestamps
    end
  end
end
