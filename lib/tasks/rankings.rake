def create_ranks(position)
  
  csv_text = File.read('app/assets/CSVs/2014rankings/' + position + '_rankings.csv')
  csv = CSV.parse(csv_text, :headers => true)
  
  n = 1

  csv.each do |rank|
    rank = rank.to_hash

    puts "----" + position + " rank " + n.to_s + " ----"
    p rank

    player = nil
    name = rank['name']
    team_abbreviation = rank['team_abbreviation']
    rank.delete("name")
    rank.delete("team_abbreviation")

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

    player.update(rank)
    puts n.to_s + " rank created!!"

    n += 1
  end

  
  
end

namespace :rankings do
  desc "import_snaps_csvs - create"
  task setup: :environment do

    Rake::Task["rankings:all"].invoke
    Rake::Task["rankings:qb"].invoke
    Rake::Task["rankings:rb"].invoke
    Rake::Task["rankings:wr"].invoke
    Rake::Task["rankings:te"].invoke
    Rake::Task["rankings:k"].invoke
    Rake::Task["rankings:dst"].invoke

  end

  desc "import rb rankings for 2014 season"
  task all: :environment do

    csv_text = File.read('app/assets/CSVs/2014rankings/all_rankings.csv')
    csv = CSV.parse(csv_text, :headers => true)
    n = 1
    csv.each do |rank|
      rank = rank.to_hash
      rank['name'] = rank['display_name'].downcase

      p "---- overall rank " + n.to_s + " ----"
      p rank

      player = Player.new(rank)
      player.save

      puts "player created!"

      n += 1
    end 

  end

  desc "import rb rankings for 2014 season"
  task qb: :environment do

    create_ranks('qb')

  end

  desc "import wr rankings for 2014 season"
  task rb: :environment do

    create_ranks('rb')

  end

  desc "import te rankings for 2014 season"
  task wr: :environment do
    
    create_ranks('wr')

  end

  desc "import te rankings for 2014 season"
  task te: :environment do

    create_ranks('te')

  end

  desc "import k rankings for 2014 season"
  task k: :environment do

    create_ranks('k')

  end

  desc "import dst rankings for 2014 season"
  task dst: :environment do

    create_ranks('dst')

  end

end
