class CompareController < ApplicationController
  before_action :get_positions, only: :index

  def index
  end

  def laboratory    
    @players = Player.all.includes(:season_stat, :season_projection)
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
