class CreateSeasonStats < ActiveRecord::Migration
  def change
    create_table :season_stats do |t|
      t.references :player, index: true

      t.integer :year

      t.integer :pass_completions
      t.integer :pass_attempts
      t.float :pass_completion_percent
      t.integer :pass_yards
      t.float :pass_yards_per_attempt
      t.integer :pass_touchdowns
      t.integer :pass_interceptions
      t.float :qb_rating
            
      t.integer :rush_attempts
      t.integer :rush_yards
      t.float :rush_yards_per_attempt
      t.integer :rush_touchdowns

      t.integer :receive_targets
      t.integer :receive_receptions
      t.integer :receive_yards
      t.integer :receive_touchdowns
      t.float :receive_completion_percent
      t.integer :receive_long
      t.float :receive_yards_per_target
      t.float :receive_yards_per_reception

      t.integer :field_goals_made
      t.integer :field_goals_attempts
      t.float :field_goals_percent
      t.integer :field_goals_long
      t.integer :extra_points_made
      t.integer :extra_points_attempts
      
      t.integer :defense_tackles_for_loss
      t.integer :defense_sacks
      t.integer :defense_qb_hits
      t.integer :defense_interceptions
      t.integer :defense_fumble_recoveries
      t.integer :defense_safeties
      t.integer :defense_touchdowns
      t.integer :defense_return_touchdowns
      t.integer :defense_points_allowed
      
      t.integer :snap_games_played
      t.integer :snap_snaps
      t.float :snap_snaps_per_game
      t.float :snap_percent
      t.float :snap_rush_percent
      t.float :snap_target_percent
      t.float :snap_reception_percent
      t.float :snap_touch_percent
      t.float :snap_util_percent
      t.float :snap_fantasy_points_percent

      t.integer :fumbles
      t.integer :fumbles_lost
      t.float :fantasy_points
      t.float :fantasy_points_per_week
      
      t.timestamps
    end
  end
end
