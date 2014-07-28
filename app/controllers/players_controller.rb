class PlayersController < ApplicationController

  def index
    @players = Player.all
    @qbs = []
    @rbs = []
    @wrs = []
    @tes = []
    @ks = []
    @dsts = []
    @others = []
    @players.each do |player|
      case player.position
      when 'QB'
        @qbs << [player.id, player.display_name] 
      when 'RB'
        @rbs << [player.id, player.display_name] 
      when 'WR'
        @wrs << [player.id, player.display_name] 
      when 'TE'
        @tes << [player.id, player.display_name] 
      when 'K'
        @ks << [player.id, player.display_name] 
      when 'DST'
        @dsts << [player.id, player.display_name] 
      else
        @others << [player.id, player.display_name]
      end
    end
  end

  def show
    @player = Player.find(params[:id])
    find_projections
    find_stats
    puts "stats --------------"
    p @stats


  end


  private 
  def find_projections
    @projections = nil
    case @player.position 
    when 'QB'
      @projections = ProjectionForQb.where(player_id: @player.id)
    when 'RB'
      @projections = ProjectionForRb.where(player_id: @player.id)
    when 'WR'
      @projections = ProjectionForWr.where(player_id: @player.id)
    when 'TE'
      @projections = ProjectionForTe.where(player_id: @player.id)
    when 'K'
      @projections = ProjectionForK.where(player_id: @player.id)
    else 
      @projections = []
    end
  end
  def find_stats
    @stats = nil
    case @player.position
    when 'QB'
      @stats = StatForQb.where(player_id: @player.id)
    when 'RB'
      @stats = StatForRb.where(player_id: @player.id)
    when 'WR'
      @stats = StatForWr.where(player_id: @player.id)
    when 'TE'
      @stats = StatForTe.where(player_id: @player.id)
    when 'K'
      @stats = StatForK.where(player_id: @player.id)
    when 'DST'
      @stats = StatForD.where(player_id: @player.id)
    else 
      @stats = []
    end

  end


end
