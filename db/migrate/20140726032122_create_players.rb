class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :position

      t.string :team
      t.string :team_abbreviation
      t.integer :bye_week
      
      t.integer :rank
      t.integer :best_rank
      t.integer :worst_rank
      t.float :average_rank
      t.float :rank_standard_deviation

      t.integer :average_draft_position
    
      t.timestamps
    end
  end
end
