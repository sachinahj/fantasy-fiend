class PlayersController < ApplicationController

  def index
    @players = Player.all.includes(:season_stat, :season_projection)
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

    @projection = {
      "pass_completions" => "----",
      "pass_attempts" => "----",
      "pass_yards" => "----",
      "pass_touchdowns" => "----",
      "pass_interceptions" => "----",
      "rush_attempts" => "----",
      "rush_yards" => "----",
      "rush_touchdowns" => "----",
      "receive_receptions" => "----",
      "receive_yards" => "----",
      "receive_touchdowns" => "----",
      "field_goals_made" => "----",
      "field_goals_attempts" => "----",
      "sos_qb_rank" => "----",
      "sos_qb_fpa" => "----",
      "sos_rb_rank" => "----",
      "sos_rb_fpa" => "----",
      "sos_wr_rank" => "----",
      "sos_wr_fpa" => "----",
      "sos_te_rank" => "----",
      "sos_te_fpa" => "----",
      "extra_points_made" => "----",
      "fumbles" => "----",
      "fantasy_points" => "----",
      "fantasy_points_per_week" => "----"
    }

    if @player.season_projection
      @projection = @player.season_projection
    end
     

    @stat = {
      "pass_completions" => "----",
      "pass_attempts" => "----",
      "pass_completion_percent" => "----",
      "pass_yards" => "----",
      "pass_yards_per_attempt" => "----",
      "pass_touchdowns" => "----",
      "pass_interceptions" => "----",
      "qb_rating" => "----",
      "rush_attempts" => "----",
      "rush_yards" => "----",
      "rush_yards_per_attempt" => "----",
      "rush_touchdowns" => "----",
      "receive_targets" => "----",
      "receive_receptions" => "----",
      "receive_yards" => "----",
      "receive_touchdowns" => "----",
      "receive_completion_percent" => "----",
      "receive_long" => "----",
      "receive_yards_per_target" => "----",
      "receive_yards_per_reception" => "----",
      "field_goals_made" => "----",
      "field_goals_attempts" => "----",
      "field_goals_percent" => "----",
      "field_goals_long" => "----",
      "extra_points_made" => "----",
      "extra_points_attempts" => "----",
      "defense_tackles_for_loss" => "----",
      "defense_sacks" => "----",
      "defense_qb_hits" => "----",
      "defense_interceptions" => "----",
      "defense_fumble_recoveries" => "----",
      "defense_safeties" => "----",
      "defense_touchdowns" => "----",
      "defense_return_touchdowns" => "----",
      "defense_points_allowed" => "----",
      "fumbles" => "----",
      "fumbles_lost" => "----",
      "fantasy_points" => "----",
      "fantasy_points_per_week" => "----",
      "fpa_qb_rank" => "----",
      "fpa_qb_fpa" => "----",
      "fpa_rb_rank" => "----",
      "fpa_rb_fpa" => "----",
      "fpa_wr_rank" => "----",
      "fpa_wr_fpa" => "----",
      "fpa_te_rank" => "----",
      "fpa_te_fpa" => "----",
      "snap_games_played" => "----",
      "snap_snaps" => "----",
      "snap_snaps_per_game" => "----",
      "snap_percent" => "----",
      "snap_rush_percent" => "----",
      "snap_target_percent" => "----",
      "snap_reception_percent" => "----",
      "snap_touch_percent" => "----",
      "snap_util_percent" => "----",
      "snap_fantasy_points_percent" => "----"
    }

    if (@player.season_stat)
      @stat = @player.season_stat
    end





  end


end

















