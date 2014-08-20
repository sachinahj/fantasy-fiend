class PlayersController < ApplicationController
  before_action :get_positions, only: [:show, :index]

  def index
    puts "---------------------"
    puts "test #{ENV["ESPNKEY"]}"
    

  end

  def show


    @player = Player.find(params[:id])


    
    if @player.season_projection != nil
      @projection = @player.season_projection
    else
      @projection = {}
    end
    
    if @player.season_stat != nil
      @stat = @player.season_stat
    else
      @stat = {}
    end

    if @player.position != "DST"
      @onTeam = Player.where(team_abbreviation: @player.team_abbreviation).where(position: ["QB", "RB", "WR", "TE"]).order("depth_chart_position ASC")

      @onTeamQBs = []
      @onTeamRBs = []
      @onTeamWRs = []
      @onTeamTEs = []
      @onTeam.each do |player|
        case player.position
        when "QB"
          @onTeamQBs << player
        when "RB"
          @onTeamRBs << player
        when "WR"
          @onTeamWRs << player
        when "TE"
          @onTeamTEs << player
        else
        end
      end
    end


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

















