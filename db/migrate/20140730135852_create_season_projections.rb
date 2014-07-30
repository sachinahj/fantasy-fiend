class CreateSeasonProjections < ActiveRecord::Migration
  def change
    create_table :season_projections do |t|
      t.references :player, index: true

      t.integer :year

      t.float :pass_completions
      t.float :pass_attempts
      t.float :pass_yards
      t.float :pass_touchdowns
      t.float :pass_interceptions
      
      t.float :rush_attempts
      t.float :rush_yards
      t.float :rush_touchdowns

      t.float :receive_receptions
      t.float :receive_yards
      t.float :receive_touchdowns

      t.float :field_goals_made
      t.float :field_goals_attempts
      t.float :extra_points_made
      t.float :extra_points_attempts

      t.float :fumbles

      t.float :fantasy_points


      t.timestamps
    end
  end
end
