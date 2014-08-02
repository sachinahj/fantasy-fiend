require 'open-uri'
require 'nokogiri'

namespace :depth_chart do

  desc "grab and set depth chart positions from FantasyPros.com"
  task setup: :environment do

    Rake::Task["depth_chart:depth_chart_position"].invoke
    Rake::Task["depth_chart:quarterbacks"].invoke

  end
  
  desc "grab and set depth chart positions from FantasyPros.com"
  task depth_chart_position: :environment do


    doc = Nokogiri::HTML(open("http://www.fantasypros.com/nfl/depth-charts.php"))
    table = doc.css('table.table.table-bordered.table-condensed.table-striped.table-hover')
    rows = table.css('td')


    data = []
    rows.each do |row|
      if row.text.start_with?('QB', 'RB', 'WR', 'TE') 
        data << row.text
      end
    end

    positions = []
    data.each do |str|
      a = str[0..1]
      b = 1

      until (b == nil)
        b = str.slice!(a)
      end

      str = str.split(/\d\s?/)
      str.shift

      str.each_index do |x|
        positions << ["#{a}#{x+1}", str[x]]
      end
    end

    positions.each do |position|
      player = nil
      player = Player.find_by name: position[1].downcase
      if player == nil
        puts "#{position[1]} player not found, has depth chart position of #{position[0]}"
      else
        player.depth_chart_position = position[0]
        player.save
      end
    end

  end


  desc "grab and set depth chart positions from FantasyPros.com"
  task quarterbacks: :environment do
    quarterbacks = Player.where(depth_chart_position: "QB1")
    players = Player.where(position: ["RB","WR","TE","K","DST"])
    players.each do |player|

      team_abbreviation = player.team_abbreviation

      quarterbacks.each do |quarterback|

        if quarterback.team_abbreviation == team_abbreviation
          player.quarterback = "#{quarterback.display_name} (#{quarterback.position_rank})"
          player.save
          puts "saved #{quarterback.display_name} for #{player.display_name}"
        end

      end

    end

  end

end



















