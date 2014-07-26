class CreateProjectionForRbs < ActiveRecord::Migration
  def change
    create_table :projection_for_rbs do |t|
      t.references :player, index: true

      t.float :rush_attempts
      t.integer :rush_attempts_high
      t.integer :rush_attempts_low

      t.float :rush_yards
      t.integer :rush_yards_high
      t.integer :rush_yards_low

      t.float :rush_touchdowns
      t.integer :rush_touchdowns_high
      t.integer :rush_touchdowns_low

      t.float :receiving_completions
      t.integer :receiving_completions_high
      t.integer :receiving_completions_low

      t.float :receiving_yards
      t.integer :receiving_yards_high
      t.integer :receiving_yards_low

      t.float :receiving_touchdowns
      t.integer :receiving_touchdowns_high
      t.integer :receiving_touchdowns_low      

      t.float :fumbles
      t.integer :fumbles_high
      t.integer :fumbles_low

      t.float :fantasy_points
      t.integer :fantasy_points_high
      t.integer :fantasy_points_low

      t.timestamps
    end
  end
end
