class CreateStatForQbs < ActiveRecord::Migration
  def change
    create_table :stat_for_qbs do |t|
      t.references :player, index: true
      
      t.integer :games_played
      t.float :qb_rating
      t.integer :pass_completions
      t.integer :pass_attempts
      t.float :pass_completion_percent
      t.integer :pass_yards
      t.float :pass_yards_per_game
      t.float :pass_yards_per_attempt
      t.integer :pass_touchdowns
      t.integer :pass_interceptions
      t.integer :rush_attempts
      t.integer :rush_yards
      t.float :rush_yards_per_game
      t.float :rush_average_yards_per_carry
      t.integer :rush_touchdowns
      t.integer :sacks
      t.integer :yards_lost
      t.integer :fumbles
      t.integer :fumbles_lost

      t.timestamps
    end
  end
end
