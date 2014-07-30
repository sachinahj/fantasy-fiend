namespace :projections do

  desc "import_projections_csvs"
  task setup: :environment do
    
    Rake::Task["projections:qb"].invoke
    Rake::Task["projections:rb"].invoke
    Rake::Task["projections:wr"].invoke
    Rake::Task["projections:te"].invoke
    Rake::Task["projections:k"].invoke

  end

  desc "import qb projections of 2014 season"
  task qb: :environment do

    csv_text = File.read('app/assets/CSVs/2014projections/qb_projections.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    n = 1

    csv.each do |projection|
      projection = projection.to_hash

      puts "----qb projection " + n.to_s + " ----"
      p projection

      player = nil
      name = projection['name']
      team_abbreviation = projection['team_abbreviation']
      projection.delete("name")
      projection.delete("team_abbreviation")
      projection["year"] = 2014

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
          position_draft_position: nil,
          overall_draft_position: nil
        }

        player = Player.new(attributes)
        player.save
        puts n.to_s + " player created!!"  
      else 
      
        puts n.to_s + " player found!!!"
        
      end

      player.create_season_projection(projection)
      puts n.to_s + " projection created!!"

      n += 1
    end

  end

  desc "import rb projections of 2014 season"
  task rb: :environment do

    csv_text = File.read('app/assets/CSVs/2014projections/rb_projections.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    n = 1

    csv.each do |projection|
      projection = projection.to_hash

      puts "----rb projection " + n.to_s + " ----"
      p projection

      player = nil
      name = projection['name']
      team_abbreviation = projection['team_abbreviation']
      projection.delete("name")
      projection.delete("team_abbreviation")
      projection["year"] = 2014

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
          position_draft_position: nil,
          overall_draft_position: nil
        }

        player = Player.new(attributes)
        player.save
        puts n.to_s + " player created!!"  
      else 
      
        puts n.to_s + " player found!!!"
        
      end

      player.create_season_projection(projection)
      puts n.to_s + " projection created!!"

      n += 1
    end

  end

  desc "import wr projections of 2014 season"
  task wr: :environment do
    
    csv_text = File.read('app/assets/CSVs/2014projections/wr_projections.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    n = 1

    csv.each do |projection|
      projection = projection.to_hash

      puts "----wr projection " + n.to_s + " ----"
      p projection

      player = nil
      name = projection['name']
      team_abbreviation = projection['team_abbreviation']
      projection.delete("name")
      projection.delete("team_abbreviation")
      projection["year"] = 2014

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
          position_draft_position: nil,
          overall_draft_position: nil
        }

        player = Player.new(attributes)
        player.save
        puts n.to_s + " player created!!"  
      else 
      
        puts n.to_s + " player found!!!"
        
      end

      player.create_season_projection(projection)
      puts n.to_s + " projection created!!"

      n += 1
    end

  end

  desc "import te projections of 2014 season"
  task te: :environment do
    
    csv_text = File.read('app/assets/CSVs/2014projections/te_projections.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    n = 1

    csv.each do |projection|
      projection = projection.to_hash

      puts "----te projection " + n.to_s + " ----"
      p projection

      player = nil
      name = projection['name']
      team_abbreviation = projection['team_abbreviation']
      projection.delete("name")
      projection.delete("team_abbreviation")
      projection["year"] = 2014

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
          position_draft_position: nil,
          overall_draft_position: nil
        }

        player = Player.new(attributes)
        player.save
        puts n.to_s + " player created!!"  
      else 
      
        puts n.to_s + " player found!!!"
        
      end

      player.create_season_projection(projection)
      puts n.to_s + " projection created!!"

      n += 1
    end

  end

  desc "import k projections of 2014 season"
  task k: :environment do
    
    csv_text = File.read('app/assets/CSVs/2014projections/k_projections.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    n = 1

    csv.each do |projection|
      projection = projection.to_hash

      puts "----k projection " + n.to_s + " ----"
      p projection

      player = nil
      name = projection['name']
      team_abbreviation = projection['team_abbreviation']
      projection.delete("name")
      projection.delete("team_abbreviation")
      projection["year"] = 2014

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
          position_draft_position: nil,
          overall_draft_position: nil
        }

        player = Player.new(attributes)
        player.save
        puts n.to_s + " player created!!"  
      else 
      
        puts n.to_s + " player found!!!"
        
      end

      player.create_season_projection(projection)
      puts n.to_s + " projection created!!"

      n += 1
    end

  end

end
