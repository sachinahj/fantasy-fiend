class CreateProjectionForKs < ActiveRecord::Migration
  def change
    create_table :projection_for_ks do |t|
      t.references :player, index: true

      t.float :field_goals_made
      t.integer :field_goals_made_high
      t.integer :field_goals_made_low

      t.float :field_goals_attempts
      t.integer :field_goals_attempts_high
      t.integer :field_goals_attempts_low

      t.float :extra_points
      t.integer :extra_points_high
      t.integer :extra_points_low

      t.float :fantasy_points
      t.integer :fantasy_points_high
      t.integer :fantasy_points_low

      t.timestamps
    end
  end
end
