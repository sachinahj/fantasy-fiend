class SeasonStat < ActiveRecord::Base
  belongs_to :player

  before_save :fp_per_week
  
  def fp_per_week
    self.fantasy_points_per_week = (fantasy_points / 16).round(2)
  end
end
