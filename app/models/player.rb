class Player < ActiveRecord::Base 
  has_one :season_projection
  has_one :season_stat

  before_save :update_from_teams_table

  def update_from_teams_table

    teamObj = Team.find_by(team_abbreviation: team_abbreviation)
    self.bye_week = teamObj.bye_week
    self.team = teamObj.team

  end

  def update_sos 
    teamObj = Team.find_by(team_abbreviation: team_abbreviation)

    if self.season_projection
      self.season_projection.sos_qb_rank = teamObj.sos_qb_rank
      self.season_projection.sos_qb_fpa = teamObj.sos_qb_fpa
      self.season_projection.sos_rb_rank = teamObj.sos_rb_rank
      self.season_projection.sos_rb_fpa = teamObj.sos_rb_fpa
      self.season_projection.sos_wr_rank = teamObj.sos_wr_rank
      self.season_projection.sos_wr_fpa = teamObj.sos_wr_fpa
      self.season_projection.sos_te_rank = teamObj.sos_te_rank
      self.season_projection.sos_te_fpa = teamObj.sos_te_fpa
      self.season_projection.save
    end

  end


end

