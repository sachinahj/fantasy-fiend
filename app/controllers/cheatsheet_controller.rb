class CheatsheetController < ApplicationController
  def index

   @players = Player
    .order('overall_rank ASC')
    .includes(
      :season_stat,
      :season_projection
    )
    # .where("overall_rank > 0")

  end

  def KsAndDSTs
    
  end
end
