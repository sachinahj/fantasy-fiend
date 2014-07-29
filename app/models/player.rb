class Player < ActiveRecord::Base 
  has_one :season2014_projection
  has_one :season2013_stat

  before_save :check_bye_week_and_team_name

  def check_bye_week_and_team_name

    teamObj = Team.find_by team_abbreviation: self.team_abbreviation
    self.bye_week = teamObj.bye_week
    self.team = teamObj.team

  end

end

