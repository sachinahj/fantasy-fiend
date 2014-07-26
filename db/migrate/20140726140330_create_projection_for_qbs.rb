class CreateProjectionForQbs < ActiveRecord::Migration
  def change
    create_table :projection_for_qbs do |t|
      t.references :player, index: true

      t.float :pass_attempts
      t.integer :pass_attempts_high
      t.integer :pass_attempts_low

      t.float :pass_completions
      t.integer :pass_completions_high
      t.integer :pass_completions_low

      t.float :pass_yards
      t.integer :pass_yards_high
      t.integer :pass_yards_low

      t.float :pass_touchdowns
      t.integer :pass_touchdowns_high
      t.integer :pass_touchdowns_low

      t.float :pass_interceptions
      t.integer :pass_interceptions_high
      t.integer :pass_interceptions_low

      t.float :rush_attempts
      t.integer :rush_attempts_high
      t.integer :rush_attempts_low

      t.float :rush_yards
      t.integer :rush_yards_high
      t.integer :rush_yards_low

      t.float :rush_touchdowns
      t.integer :rush_touchdowns_high
      t.integer :rush_touchdowns_low

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
