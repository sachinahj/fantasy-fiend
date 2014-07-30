class CompareController < ApplicationController
  def index
    @quarterbacks = Player.all.where(position: "QB").includes(:season_stat, :season_projection)
    @runningbacks = Player.all.where(position: "RB").includes(:season_stat, :season_projection)
    @receivers = Player.all.where(position: "WR").includes(:season_stat, :season_projection)
    @tightends = Player.all.where(position: "TE").includes(:season_stat, :season_projection)
    @kickers = Player.all.where(position: "K").includes(:season_stat, :season_projection)
    @defenses = Player.all.where(position: "DST").includes(:season_stat, :season_projection)
  end
  def quarterbacks 
    @quarterbacks = Player.all.where(position: "QB").where("overall_draft_position < 100").includes(:season_stat, :season_projection)
  end

  def runningbacks 
    @runningbacks = Player.where(position: "RB").includes(:season2013_stat, :season2014_projection)
  end

  def receivers 
    @receivers = Player.where(position: "WR").includes(:season2013_stat, :season2014_projection)
  end

  def tightends 
    @tightends = Player.where(position: "TE").includes(:season2013_stat, :season2014_projection)
  end

  def kickers 
    @kickers = Player.where(position: "K").includes(:season2013_stat, :season2014_projection)
  end

  def defenses
    @defenses= Player.where(position: "DST").includes(:season2013_stat, :season2014_projection)
  end
  
end
