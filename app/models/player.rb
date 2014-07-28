class Player < ActiveRecord::Base 
  has_one :projection_for_qb
  has_one :projection_for_rb
  has_one :projection_for_wr
  has_one :projection_for_te
  has_one :projection_for_k

  has_one :stat_for_qb
  has_one :stat_for_rb
  has_one :stat_for_wr
  has_one :stat_for_te
  has_one :stat_for_k
  has_one :stat_for_d

  before_save :check_bye_week_and_team_name

  def check_bye_week_and_team_name

    teamObj = Team.find_by team_abbreviation: self.team_abbreviation
    self.bye_week = teamObj.bye_week
    self.team = teamObj.team

  end

  def to_json(options = nil)
    if position == 'QB'
      super(options || {include: [:stat_for_qb, :projection_for_qb]})
    elsif position == 'RB'
      super(options || {include: [:stat_for_rb, :projection_for_rb]})
    elsif position == 'WR'
      super(options || {include: [:stat_for_wr, :projection_for_wr]})
    elsif position == 'TE'
      super(options || {include: [:stat_for_te, :projection_for_te]})
    elsif position == 'K'
      super(options || {include: [:stat_for_k, :projection_for_k]})
    elsif position == 'DST'
      super(options || {include: :stat_for_d})
    else
      nil
    end


  end

end

