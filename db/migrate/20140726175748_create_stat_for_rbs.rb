class CreateStatForRbs < ActiveRecord::Migration
  def change
    create_table :stat_for_rbs do |t|
      t.references :player, index: true

      t.integer :games_played
      t.integer :rush_attempts
      t.integer :rush_yards
      t.float :rush_yards_per_game
      t.float :rush_average_yards_per_carry
      t.integer :rush_touchdowns
      t.integer :receiving_completions
      t.integer :receiving_target
      t.integer :receiving_yards
      t.float :receiving_yards_per_game
      t.float :receiving_average_yards_per_completion
      t.integer :receiving_long
      t.float :receiving_yards_after_catch
      t.integer :receiving_first_downs
      t.integer :receiving_touchdowns
      t.integer :fumbles
      t.integer :fumbles_lost


      t.timestamps
    end
  end
end
