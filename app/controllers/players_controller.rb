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
    @projections = @player.season2014_projection
    @stats = @player.season2013_stat

    respond_to do |format|
      format.html
      format.json {render json: @player.to_json}
    end

  end


  private 

  def find_projections

    @projections = nil
    case @player.position 
    when 'QB'
      @projections = @player.projection_for_qb
    when 'RB'
      @projections = @player.projection_for_rb
    when 'WR'
      @projections = @player.projection_for_wr
    when 'TE'
      @projections = @player.projection_for_te
    when 'K'
      @projections = @player.projection_for_k
    else 
      @projections = nil
    end

  end

  def find_stats

    @stats = nil
    case @player.position
    when 'QB'
      @stats = @player.stat_for_qb
    when 'RB'
      @stats = @player.stat_for_rb
    when 'WR'
      @stats = @player.stat_for_wr
    when 'TE'
      @stats = @player.stat_for_te
    when 'K'
      @stats = @player.stat_for_k
    when 'DST'
      @stats = @player.stat_for_d
    else 
      @stats = nil
    end

  end

end
