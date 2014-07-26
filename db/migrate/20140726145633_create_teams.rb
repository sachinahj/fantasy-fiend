class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :team
      t.string :team_abbreviation
      t.integer :bye_week

      t.timestamps
    end
  end
end
