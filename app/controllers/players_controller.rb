class PlayersController < ApplicationController

  def index
    @players = Player.all
    @data = []
    @players.each do |player|
      object = {id: player.id, text: player.name}
      @data << object
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
      @projections = nil
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
      @stats = nil
    end

  end


end
