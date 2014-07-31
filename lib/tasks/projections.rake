def create_projections(position)

  csv_text = File.read('app/assets/CSVs/2014projections/' + position + '_projections.csv')
  csv = CSV.parse(csv_text, :headers => true)
  
  n = 1

  csv.each do |projection|
    projection = projection.to_hash

    puts "----" + position + " projection " + n.to_s + " ----"
    p projection

    player = nil
    name = projection['name']
    team_abbreviation = projection['team_abbreviation']
    projection.delete("name")
    projection.delete("team_abbreviation")
    projection["year"] = 2014

    player = Player.where(name: name.downcase).where(team_abbreviation: team_abbreviation).first

    if player == nil 
        
      puts n.to_s + " player not found!!!"
      attributes = {
        name: name.downcase,
        display_name: name,
        position: position.upcase,
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

    create_projections('qb')

  end

  desc "import rb projections of 2014 season"
  task rb: :environment do

    create_projections('rb')   

  end

  desc "import wr projections of 2014 season"
  task wr: :environment do
    
    create_projections('wr')

  end

  desc "import te projections of 2014 season"
  task te: :environment do
    
    create_projections('te')

  end

  desc "import k projections of 2014 season"
  task k: :environment do
    
    create_projections('k')

  end

end
