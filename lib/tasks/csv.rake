require 'csv'

namespace :csv do

  desc "import_csvs"
  task setup: :environment do
    
    Rake::Task["csv:from_teams"].invoke
    Rake::Task["csv:from_rankings"].invoke
    Rake::Task["csv:from_qb_projections"].invoke
    Rake::Task["csv:from_rb_projections"].invoke
    Rake::Task["csv:from_wr_projections"].invoke
    Rake::Task["csv:from_te_projections"].invoke
    Rake::Task["csv:from_k_projections"].invoke

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

# Imports qb projections from qb_projections.csv into ProjectionForQbs table, belongs_to player
  desc "imports qb_projections from qb_projections.csv"
  task from_qb_projections: :environment do
    
    csv_text = File.read('app/assets/CSVs/projections/QB_projections.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    n = 1

    csv.each do |projection|
      projection = projection.to_hash

      puts "----projection " + n.to_s
      p projection

      player = nil
      name = projection['name'].downcase
      team_abbreviation = projection['team_abbreviation']
      projection.delete("name")
      projection.delete("team_abbreviation")

      player = Player.find_by name: name

      if player == nil 
      
        puts n.to_s + " player not found!!!"
        attributes = {
          name: name,
          position: "QB",
          team: nil,
          team_abbreviation: team_abbreviation,
          bye_week: nil,
          rank: nil,
          best_rank: nil,
          worst_rank: nil,
          average_rank: nil,
          rank_standard_deviation: nil,
          average_draft_position: nil,
        }

        player = Player.new(attributes)
        player.save
        puts n.to_s + " player created!!"  
      else 
      
        puts n.to_s + " player found!!!"
        
      end

      projection["player"] = player
      ProjectionForQb.create(projection)
      puts n.to_s + " projection created!!"

      n += 1
    end
  end


# Imports rb projections from rb_projections.csv into ProjectionForRbs table, belongs_to player
  desc "imports rb_projections from rb_projections.csv"
  task from_rb_projections: :environment do
    
    csv_text = File.read('app/assets/CSVs/projections/RB_projections.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    n = 1

    csv.each do |projection|
      projection = projection.to_hash

      puts "----projection " + n.to_s
      p projection

      player = nil
      name = projection['name'].downcase
      team_abbreviation = projection['team_abbreviation']
      projection.delete("name")
      projection.delete("team_abbreviation")

      player = Player.find_by name: name

      if player == nil 
      
        puts n.to_s + " player not found!!!"
        attributes = {
          name: name,
          position: "RB",
          team: nil,
          team_abbreviation: team_abbreviation,
          bye_week: nil,
          rank: nil,
          best_rank: nil,
          worst_rank: nil,
          average_rank: nil,
          rank_standard_deviation: nil,
          average_draft_position: nil,
        }

        player = Player.new(attributes)
        player.save
        puts n.to_s + " player created!!"  
      else 
      
        puts n.to_s + " player found!!!"
        
      end

      projection["player"] = player
      ProjectionForRb.create(projection)
      puts n.to_s + " projection created!!"

      n += 1
    end
  end


# Imports wr projections from wr_projections.csv into ProjectionForWrs table, belongs_to player
  desc "imports wr_projections from wr_projections.csv"
  task from_wr_projections: :environment do
    
    csv_text = File.read('app/assets/CSVs/projections/WR_projections.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    n = 1

    csv.each do |projection|
      projection = projection.to_hash

      puts "----projection " + n.to_s
      p projection

      player = nil
      name = projection['name'].downcase
      team_abbreviation = projection['team_abbreviation']
      projection.delete("name")
      projection.delete("team_abbreviation")

      player = Player.find_by name: name

      if player == nil 
      
        puts n.to_s + " player not found!!!"
        attributes = {
          name: name,
          position: "WR",
          team: nil,
          team_abbreviation: team_abbreviation,
          bye_week: nil,
          rank: nil,
          best_rank: nil,
          worst_rank: nil,
          average_rank: nil,
          rank_standard_deviation: nil,
          average_draft_position: nil,
        }

        player = Player.new(attributes)
        player.save
        puts n.to_s + " player created!!"  
      else 
      
        puts n.to_s + " player found!!!"
        
      end

      projection["player"] = player
      ProjectionForWr.create(projection)
      puts n.to_s + " projection created!!"

      n += 1
    end
  end




# Imports te projections from te_projections.csv into ProjectionForTes table, belongs_to player
  desc "imports te_projections from te_projections.csv"
  task from_te_projections: :environment do
    
    csv_text = File.read('app/assets/CSVs/projections/TE_projections.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    n = 1

    csv.each do |projection|
      projection = projection.to_hash

      puts "----projection " + n.to_s
      p projection

      player = nil
      name = projection['name'].downcase
      team_abbreviation = projection['team_abbreviation']
      projection.delete("name")
      projection.delete("team_abbreviation")

      player = Player.find_by name: name

      if player == nil 
      
        puts n.to_s + " player not found!!!"
        attributes = {
          name: name,
          position: "TE",
          team: nil,
          team_abbreviation: team_abbreviation,
          bye_week: nil,
          rank: nil,
          best_rank: nil,
          worst_rank: nil,
          average_rank: nil,
          rank_standard_deviation: nil,
          average_draft_position: nil,
        }

        player = Player.new(attributes)
        player.save
        puts n.to_s + " player created!!"  
      else 
      
        puts n.to_s + " player found!!!"
        
      end

      projection["player"] = player
      ProjectionForTe.create(projection)
      puts n.to_s + " projection created!!"

      n += 1
    end
  end


# Imports k projections from k_projections.csv into ProjectionForKs table, belongs_to player
  desc "imports k_projections from k_projections.csv"
  task from_k_projections: :environment do
    
    csv_text = File.read('app/assets/CSVs/projections/K_projections.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    n = 1

    csv.each do |projection|
      projection = projection.to_hash

      puts "----projection " + n.to_s
      p projection

      player = nil
      name = projection['name'].downcase
      team_abbreviation = projection['team_abbreviation']
      projection.delete("name")
      projection.delete("team_abbreviation")

      player = Player.find_by name: name

      if player == nil 
      
        puts n.to_s + " player not found!!!"
        attributes = {
          name: name,
          position: "K",
          team: nil,
          team_abbreviation: team_abbreviation,
          bye_week: nil,
          rank: nil,
          best_rank: nil,
          worst_rank: nil,
          average_rank: nil,
          rank_standard_deviation: nil,
          average_draft_position: nil,
        }

        player = Player.new(attributes)
        player.save
        puts n.to_s + " player created!!"  
      else 
      
        puts n.to_s + " player found!!!"
        
      end

      projection["player"] = player
      ProjectionForK.create(projection)
      puts n.to_s + " projection created!!"

      n += 1
    end
  end


end
