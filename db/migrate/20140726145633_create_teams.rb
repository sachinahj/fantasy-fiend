class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :team
      t.string :team_abbreviation
      t.integer :bye_week

      t.integer :sos_qb_rank
      t.float :sos_qb_fpa
      t.integer :sos_rb_rank
      t.float :sos_rb_fpa
      t.integer :sos_wr_rank
      t.float :sos_wr_fpa
      t.integer :sos_te_rank
      t.float :sos_te_fpa

      t.timestamps
    end
  end
end
