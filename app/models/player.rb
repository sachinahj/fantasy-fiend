class Player < ActiveRecord::Base 
  has_one :projectionforqb
  has_one :projectionforrb
  has_one :projectionforwr
  has_one :projectionforte
  has_one :projectionfork

  has_one :statforqb
  has_one :statforrb
  has_one :statforwr
  has_one :statforte
  has_one :statfork
  has_one :statford

  before_save :check_bye_week_and_team_name

  def check_bye_week_and_team_name
    teamObj = Team.find_by team_abbreviation: self.team_abbreviation
    self.bye_week = teamObj.bye_week
    self.team = teamObj.team
  end

end

