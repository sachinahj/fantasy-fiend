def create_stats(position)

  csv_text = File.read('app/assets/CSVs/2013stats/' + position + '_stats.csv')
  csv = CSV.parse(csv_text, :headers => true)
  
  n = 1

  csv.each do |stats|
    stats = stats.to_hash

    puts "----" + position + " stats " + n.to_s + " ----"
    p stats

    player = nil
    name = stats['name'].downcase
    team_abbreviation = stats['team_abbreviation']
    stats.delete("name")
    stats.delete("team_abbreviation")
    stats.delete("rank")
    stats.delete("position")
    stats["year"] = 2013

    player = Player.where(name: name.downcase).where(team_abbreviation: team_abbreviation).first

    if player == nil 
      puts n.to_s + " player not found!!!"
    else 
      puts n.to_s + " player found!!!"
      player.create_season_stat(stats)
      puts n.to_s + " stats created!!"
    end

    n += 1
  end

end


namespace :stats do
  
  desc "import_stats_csvs"
  task setup: :environment do

    Rake::Task["stats:qb"].invoke
    Rake::Task["stats:rb"].invoke
    Rake::Task["stats:wr"].invoke
    Rake::Task["stats:te"].invoke
    Rake::Task["stats:k"].invoke
    Rake::Task["stats:dst"].invoke

  end

  desc "import qb stats from 2013 season"
  task qb: :environment do

    create_stats('qb')
    
  end

  desc "import rb stats from 2013 season"
  task rb: :environment do

    create_stats('rb')
    
  end


  desc "import wr stats from 2013 season"
  task wr: :environment do

    create_stats('wr')
    
  end

  desc "import te stats from 2013 season"
  task te: :environment do

    create_stats('te')

  end


  desc "import k stats from 2013 season"
  task k: :environment do

    create_stats('k')

  end

  desc "import dst stats from 2013 season"
  task dst: :environment do

    create_stats('dst')
    
  end

end
