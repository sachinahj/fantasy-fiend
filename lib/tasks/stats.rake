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

    csv_text = File.read('app/assets/CSVs/2013stats/qb_stats.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    n = 1

    csv.each do |stats|
      stats = stats.to_hash

      puts "----qb stats " + n.to_s + " ----"
      p stats

      player = nil
      name = stats['name'].downcase
      team_abbreviation = stats['team_abbreviation']
      stats.delete("name")
      stats.delete("team_abbreviation")
      stats.delete("rank")
      stats.delete("position")
      stats["year"] = 2013

      player = Player.find_by name: name

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

  desc "import rb stats from 2013 season"
  task rb: :environment do

    csv_text = File.read('app/assets/CSVs/2013stats/rb_stats.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    n = 1

    csv.each do |stats|
      stats = stats.to_hash

      puts "----rb stats " + n.to_s + " ----"
      p stats

      player = nil
      name = stats['name'].downcase
      team_abbreviation = stats['team_abbreviation']
      stats.delete("name")
      stats.delete("team_abbreviation")
      stats.delete("rank")
      stats.delete("position")
      stats["year"] = 2013

      player = Player.find_by name: name

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


  desc "import wr stats from 2013 season"
  task wr: :environment do

    csv_text = File.read('app/assets/CSVs/2013stats/wr_stats.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    n = 1

    csv.each do |stats|
      stats = stats.to_hash

      puts "----wr stats " + n.to_s + " ----"
      p stats

      player = nil
      name = stats['name'].downcase
      team_abbreviation = stats['team_abbreviation']
      stats.delete("name")
      stats.delete("team_abbreviation")
      stats.delete("rank")
      stats.delete("position")
      stats["year"] = 2013

      player = Player.find_by name: name

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

  desc "import te stats from 2013 season"
  task te: :environment do

    csv_text = File.read('app/assets/CSVs/2013stats/te_stats.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    n = 1

    csv.each do |stats|
      stats = stats.to_hash

      puts "----te stats " + n.to_s + " ----"
      p stats

      player = nil
      name = stats['name'].downcase
      team_abbreviation = stats['team_abbreviation']
      stats.delete("name")
      stats.delete("team_abbreviation")
      stats.delete("rank")
      stats.delete("position")
      stats["year"] = 2013

      player = Player.find_by name: name

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


  desc "import k stats from 2013 season"
  task k: :environment do

    csv_text = File.read('app/assets/CSVs/2013stats/k_stats.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    n = 1

    csv.each do |stats|
      stats = stats.to_hash

      puts "----k stats " + n.to_s + " ----"
      p stats

      player = nil
      name = stats['name'].downcase
      team_abbreviation = stats['team_abbreviation']
      stats.delete("name")
      stats.delete("team_abbreviation")
      stats.delete("rank")
      stats.delete("position")
      stats["year"] = 2013

      player = Player.find_by name: name

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

  desc "import dst stats from 2013 season"
  task dst: :environment do

    csv_text = File.read('app/assets/CSVs/2013stats/dst_stats.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    n = 1

    csv.each do |stats|
      stats = stats.to_hash

      puts "----dst stats " + n.to_s + " ----"
      p stats

      player = nil
      name = stats['name'].downcase
      team_abbreviation = stats['team_abbreviation']
      stats.delete("name")
      stats.delete("team_abbreviation")
      stats.delete("rank")
      stats.delete("position")
      stats["year"] = 2013

      player = Player.find_by name: name

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

end
