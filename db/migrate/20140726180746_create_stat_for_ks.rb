class CreateStatForKs < ActiveRecord::Migration
  def change
    create_table :stat_for_ks do |t|
      t.references :player, index: true

      t.integer :games_played
      t.integer :yards_0_to_19_made
      t.integer :yards_0_to_19_attempts
      t.float :yards_0_to_19_percent
      t.integer :yards_20_to_29_made
      t.integer :yards_20_to_29_attempts
      t.float :yards_20_to_29_percent
      t.integer :yards_30_to_39_made
      t.integer :yards_30_to_39_attempts
      t.float :yards_30_to_39_percent
      t.integer :yards_40_to_49_made
      t.integer :yards_40_to_49_attempts
      t.float :yards_40_to_49_percent
      t.integer :yards_50_made
      t.integer :yards_50_attempts
      t.float :yards_50_percent
      t.integer :field_goals_made
      t.integer :field_goals_attempts
      t.float :field_goals_percent
      t.integer :field_goals_long
      t.integer :extra_points
      t.integer :extra_points_attempts
      t.float :extra_points_percent
      t.integer :points



      t.timestamps

    end
  end
end
