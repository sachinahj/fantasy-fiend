 class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :display_name
      t.string :position

      t.string :team
      t.string :team_abbreviation
      t.integer :bye_week
      
      t.integer :position_draft_position
      t.integer :overall_draft_position

      t.string :quarterback
      t.string :depth_chart_position
    
      t.timestamps
    end
  end
end
