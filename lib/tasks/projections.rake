namespace :projections do

  desc "import_projections_csvs"
  task setup: :environment do
    
    Rake::Task["projections:qb"].invoke
    Rake::Task["projections:rb"].invoke
    Rake::Task["projections:wr"].invoke
    Rake::Task["projections:te"].invoke

  end

  desc "import qb projections of 2014 season"
  task qb: :environment do
    csv_text = File.read('app/assets/CSVs/projections/QB_projections.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    n = 1

    csv.each do |projection|
      projection = projection.to_hash

      puts "----projection " + n.to_s
      p projection

      player = nil
      name = projection['name']
      team_abbreviation = projection['team_abbreviation']
      projection.delete("name")
      projection.delete("team_abbreviation")

      player = Player.find_by name: name.downcase

      if player == nil 
          
        puts n.to_s + " player not found!!!"
        attributes = {
          name: name.downcase,
          display_name: name,
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

  desc "import rb projections of 2014 season"
  task rb: :environment do
    csv_text = File.read('app/assets/CSVs/projections/RB_projections.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    n = 1

    csv.each do |projection|
      projection = projection.to_hash

      puts "----projection " + n.to_s
      p projection

      player = nil
      name = projection['name']
      team_abbreviation = projection['team_abbreviation']
      projection.delete("name")
      projection.delete("team_abbreviation")

      player = Player.find_by name: name.downcase

      if player == nil 
      
        puts n.to_s + " player not found!!!"
        attributes = {
          name: name.downcase,
          display_name: name,
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

  desc "import wr projections of 2014 season"
  task wr: :environment do
    csv_text = File.read('app/assets/CSVs/projections/WR_projections.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    n = 1

    csv.each do |projection|
      projection = projection.to_hash

      puts "----projection " + n.to_s
      p projection

      player = nil
      name = projection['name']
      team_abbreviation = projection['team_abbreviation']
      projection.delete("name")
      projection.delete("team_abbreviation")

      player = Player.find_by name: name.downcase

      if player == nil 
      
        puts n.to_s + " player not found!!!"
        attributes = {
          name: name.downcase,
          display_name: name,
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

  desc "import te projections of 2014 season"
  task te: :environment do
    csv_text = File.read('app/assets/CSVs/projections/TE_projections.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    n = 1

    csv.each do |projection|
      projection = projection.to_hash

      puts "----projection " + n.to_s
      p projection

      player = nil
      name = projection['name']
      team_abbreviation = projection['team_abbreviation']
      projection.delete("name")
      projection.delete("team_abbreviation")

      player = Player.find_by name: name.downcase

      if player == nil 
      
        puts n.to_s + " player not found!!!"
        attributes = {
          name: name.downcase,
          display_name: name,
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

  desc "import k projections of 2014 season"
  task k: :environment do
    csv_text = File.read('app/assets/CSVs/projections/K_projections.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    n = 1

    csv.each do |projection|
      projection = projection.to_hash

      puts "----projection " + n.to_s
      p projection

      player = nil
      name = projection['name']
      team_abbreviation = projection['team_abbreviation']
      projection.delete("name")
      projection.delete("team_abbreviation")

      player = Player.find_by name: name.downcase

      if player == nil 
      
        puts n.to_s + " player not found!!!"
        attributes = {
          name: name.downcase,
          display_name: name,
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
