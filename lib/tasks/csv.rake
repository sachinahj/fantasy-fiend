require 'csv'
namespace :csv do

  desc "import_initial_csvs"
  task setup: :environment do
    Rake::Task["csv:teams"].invoke
    Rake::Task["adp:setup"].invoke
    Rake::Task["projections:setup"].invoke
    Rake::Task["stats:setup"].invoke
    Rake::Task["snaps:setup"].invoke

  end


# Imports teams from teams.csv into Teams table, no relationships
  desc "imports teams from teams.csv"
  task teams: :environment do
    
    csv_text = File.read('app/assets/CSVs/teams.csv')
    csv = CSV.parse(csv_text, :headers => true)
    n = 1
    csv.each do |team|
      team = team.to_hash

      p "----team " + n.to_s
      p team

      Team.create(team)
      n += 1 
    end

  end

# NOT IN USE
  desc "imports schedule from schedule.csv"
  task schedule: :environment do
    
    csv_text = File.read('app/assets/CSVs/teams.csv')
    csv = CSV.parse(csv_text, :headers => true)
    n = 1
    csv.each do |game|
      game = game.to_hash

      p "----game " + n.to_s
      p game

      n += 1 
    end

  end

# Imports players from rankings.csv into Players table, has_one projection
  desc "imports players from rankings.csv"
  task players: :environment do
    
    csv_text = File.read('app/assets/CSVs/rankings.csv')
    csv = CSV.parse(csv_text, :headers => true)
    n = 1
    csv.each do |ranking|
      ranking = ranking.to_hash

      p "----ranking " + n.to_s
      ranking['name'] = ranking['display_name'].downcase
      p ranking

      player = Player.new(ranking)
      player.save

      n += 1 
    end

  end



end
