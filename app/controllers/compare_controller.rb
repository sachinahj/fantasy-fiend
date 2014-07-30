class CompareController < ApplicationController

  def quarterbacks 
    @quarterbacks = Player.where(position: "QB").includes(:season2013_stat, :season2014_projection)
  end

  def runningbacks 
    @runningbacks = Player.where(position: "QB").includes(:season2013_stat, :season2014_projection)
  end

  def receivers 
    @receivers = Player.where(position: "QB").includes(:season2013_stat, :season2014_projection)
  end

  def tightends 
    @tightends = Player.where(position: "QB").includes(:season2013_stat, :season2014_projection)
  end

  def kickers 
    @kickers = Player.where(position: "QB").includes(:season2013_stat, :season2014_projection)
  end

  def defenses
    @defenses= Player.where(position: "QB").includes(:season2013_stat, :season2014_projection)
  end
  
end
