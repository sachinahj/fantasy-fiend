require 'csv'

namespace :csv do

  desc "import_initial_csvs"
  task setup: :environment do
    
    Rake::Task["csv:from_teams"].invoke
    Rake::Task["csv:from_rankings"].invoke

  end

# Imports teams from teams.csv into Teams table, no relationships
  desc "imports teams from teams.csv"
  task from_teams: :environment do
    
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
  desc "imports teams from teams.csv"
  task from_schedule: :environment do
    
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
  desc "imports rankings from rankings.csv"
  task from_rankings: :environment do
    
    csv_text = File.read('app/assets/CSVs/rankings.csv')
    csv = CSV.parse(csv_text, :headers => true)
    n = 1
    csv.each do |ranking|
      ranking = ranking.to_hash

      p "----ranking " + n.to_s
      ranking['name'] = ranking['name'].downcase
      p ranking

      player = Player.new(ranking)
      player.save

      n += 1 
    end
    
  end



end
