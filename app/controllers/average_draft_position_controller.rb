class AverageDraftPositionController < ApplicationController

  def index

    @players = Player
      .where("overall_draft_position > 0")
      .order('overall_draft_position ASC')
      .includes(
        :season2013_stat,
        :season2014_projection
      )

  end

end


# Player.where("average_draft_position IS NOT NULL").order('average_draft_position ASC').includes(:projection_for_qb,:projection_for_rb,:projection_for_wr,:projection_for_te,:projection_for_k,:stat_for_qb,:stat_for_rb,:stat_for_wr,:stat_for_te,:stat_for_k,:stat_for_d)


# .as_json({
#   :include => [
#     {projection_for_qb: {only: :fantasy_points}},
#     {projection_for_rb: {only: :fantasy_points}},
#     {projection_for_wr: {only: :fantasy_points}},
#     {projection_for_te: {only: :fantasy_points}},
#     {projection_for_k: {only: :fantasy_points}}
# ], only: [
#   :id,
#   :average_draft_position,
#   :display_name, 
#   :position, 
#   :team_abbreviation,
#   :bye_week,
#   :rank,
#   :best_rank,
#   :worst_rank,
# ]})







