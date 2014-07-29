class CompareController < ApplicationController
  def quarterbacks
    @quarterbacks = Player.where(position: "QB").includes(:projection_for_qb, :stat_for_qb)
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
