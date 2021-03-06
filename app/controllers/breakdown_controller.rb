class BreakdownController < ApplicationController
  before_action :get_positions, only: [:draft, :players]

  def draft
  end

  def players
  end
  
  def KsAndDSTs  
  end

  private 

  def get_positions

    @players = Player.all.includes(:season_stat, :season_projection).order("overall_rank ASC")
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
