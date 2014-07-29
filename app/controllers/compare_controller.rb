class CompareController < ApplicationController
  def quarterbacks
    @quarterbacks = Player.where(position: "QB").includes(:projection_for_qb, :stat_for_qb).limit(10)

    @completions = []
    @attempts = []
    @yards = []
    @touchdowns = []
    @interceptions = [] 
    @fantasy_points = []
    
    @series = []
    @quarterbacks.each do |quarterback|
      qb = {
        name: quarterback.display_name,
        data: [
          quarterback.projection_for_qb.pass_completions,
          quarterback.projection_for_qb.pass_attempts,
          quarterback.projection_for_qb.pass_yards,
          quarterback.projection_for_qb.pass_touchdowns,
          quarterback.projection_for_qb.pass_interceptions,
          quarterback.projection_for_qb.fantasy_points
        ]
      }
      @series << qb
    end
  end

  def runningbacks
    @runningbacks = Player.where(position: "RB").includes(:projection_for_rb, :stat_for_rb)
  end

  def receivers
    @receivers = Player.where(position: "WR").includes(:projection_for_wr, :stat_for_wr)
  end

  def tightends
    @tightends = Player.where(position: "TE").includes(:projection_for_te, :stat_for_te)
  end

  def kickers
    @kickers = Player.where(position: "K").includes(:projection_for_k, :stat_for_k)
  end

  def defenses
    @defenses = Player.where(position: "DST").includes(:stat_for_d)
  end
end
