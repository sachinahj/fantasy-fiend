class CreateProjectionForTes < ActiveRecord::Migration
  def change
    create_table :projection_for_tes do |t|
      t.references :player, index: true

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
      t.float :fantasy_points_high
      t.float :fantasy_points_low

      t.timestamps
    end
  end
end
