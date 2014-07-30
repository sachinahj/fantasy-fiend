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
    @projections = @player.season_projection
    @stats = @player.season_stat

    respond_to do |format|
      format.html
      format.json {render json: @player.to_json}
    end

  end

end
