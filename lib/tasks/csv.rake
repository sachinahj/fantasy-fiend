require 'csv'
namespace :csv do

  desc "test"
  task test: :environment do

    Rake::Task["csv:teams"].invoke
    Rake::Task["rankings:setup"].invoke
    Rake::Task["draft_positions:setup"].invoke
    Rake::Task["projections:setup"].invoke
    Rake::Task["stats:setup"].invoke
    Rake::Task["snaps:setup"].invoke
    Rake::Task["depth_chart:setup"].invoke

  end

  desc "import_csvs"
  task setup: :environment do

      Rake::Task["csv:teams"].invoke
    Rake::Task["rankings:setup"].invoke
    Rake::Task["draft_positions:setup"].invoke
    Rake::Task["projections:setup"].invoke
    Rake::Task["stats:setup"].invoke
    Rake::Task["snaps:setup"].invoke
    Rake::Task["depth_chart:setup"].invoke


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

end
