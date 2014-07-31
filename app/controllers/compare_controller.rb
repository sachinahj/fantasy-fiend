class CompareController < ApplicationController
  before_action :get_positions, only: [:index, :laboratory ]

  def index
  end

  def laboratory
    
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

  private 

  def get_positions

    @players = Player.all.includes(:season_stat, :season_projection)
    @quarterbacks = []
    @runningbacks = []
    @receivers = []
    @tightends = []
    @kickers = []
    @defenses = []
    @others = []


    @players.each do |player|
      case player.position
      when 'QB'
        @quarterbacks << player
      when 'RB'
        @runningbacks << player
      when 'WR'
        @receivers << player
      when 'TE'
        @tightends << player
      when 'K'
        @kickers << player
      when 'DST'
        @defenses << player
      else
        @others << player
      end
    end

  end
  
end
