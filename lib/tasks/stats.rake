namespace :stats do
  
  desc "import_stats_csvs"
  task setup: :environment do

    Rake::Task["stats:qb"].invoke
    Rake::Task["stats:rb"].invoke
    Rake::Task["stats:wr"].invoke
    Rake::Task["stats:te"].invoke
    Rake::Task["stats:k"].invoke
    Rake::Task["stats:d"].invoke

  end

  desc "import qb stats from 2013 season"
  task qb: :environment do

    csv_text = File.read('app/assets/CSVs/stats/QB_Stats.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    n = 1

    csv.each do |stats|
      stats = stats.to_hash

      puts "----stats " + n.to_s
      p stats

      player = nil
      name = stats['name'].downcase
      team_abbreviation = stats['team_abbreviation']
      stats.delete("name")
      stats.delete("team_abbreviation")

      player = Player.find_by name: name

      if player == nil 
        puts n.to_s + " player not found!!!"
      else 
        puts n.to_s + " player found!!!"
        stats["player"] = player
        StatForQb.create(stats)
        puts n.to_s + " stats created!!"
      end

      n += 1
    end
    
  end

  desc "import rb stats from 2013 season"
  task rb: :environment do

    csv_text = File.read('app/assets/CSVs/stats/RB_Stats.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    n = 1

    csv.each do |stats|
      stats = stats.to_hash

      puts "----stats " + n.to_s
      p stats

      player = nil
      name = stats['name'].downcase
      team_abbreviation = stats['team_abbreviation']
      stats.delete("name")
      stats.delete("team_abbreviation")

      player = Player.find_by name: name

      if player == nil 
        puts n.to_s + " player not found!!!"
      else 
        puts n.to_s + " player found!!!"
        stats["player"] = player
        StatForRb.create(stats)
        puts n.to_s + " stats created!!"
      end

      n += 1
    end
    
  end


  desc "import wr stats from 2013 season"
  task wr: :environment do

    csv_text = File.read('app/assets/CSVs/stats/WR_Stats.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    n = 1

    csv.each do |stats|
      stats = stats.to_hash

      puts "----stats " + n.to_s
      p stats

      player = nil
      name = stats['name'].downcase
      team_abbreviation = stats['team_abbreviation']
      stats.delete("name")
      stats.delete("team_abbreviation")

      player = Player.find_by name: name

      if player == nil 
        puts n.to_s + " player not found!!!"
      else 
        puts n.to_s + " player found!!!"
        stats["player"] = player
        StatForWr.create(stats)
        puts n.to_s + " stats created!!"
      end

      n += 1
    end
    
  end

  desc "import te stats from 2013 season"
  task te: :environment do

    csv_text = File.read('app/assets/CSVs/stats/TE_Stats.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    n = 1

    csv.each do |stats|
      stats = stats.to_hash

      puts "----stats " + n.to_s
      p stats

      player = nil
      name = stats['name'].downcase
      team_abbreviation = stats['team_abbreviation']
      stats.delete("name")
      stats.delete("team_abbreviation")

      player = Player.find_by name: name

      if player == nil 
        puts n.to_s + " player not found!!!"
      else 
        puts n.to_s + " player found!!!"
        stats["player"] = player
        StatForTe.create(stats)
        puts n.to_s + " stats created!!"
      end

      n += 1
    end
  end


  desc "import k stats from 2013 season"
  task k: :environment do

    csv_text = File.read('app/assets/CSVs/stats/K_Stats.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    n = 1

    csv.each do |stats|
      stats = stats.to_hash

      puts "----stats " + n.to_s
      p stats

      player = nil
      name = stats['name'].downcase
      team_abbreviation = stats['team_abbreviation']
      stats.delete("name")
      stats.delete("team_abbreviation")

      player = Player.find_by name: name

      if player == nil 
        puts n.to_s + " player not found!!!"
      else 
        puts n.to_s + " player found!!!"
        stats["player"] = player
        StatForK.create(stats)
        puts n.to_s + " stats created!!"
      end

      n += 1
    end
    
  end

  desc "import d stats from 2013 season"
  task d: :environment do

    csv_text = File.read('app/assets/CSVs/stats/D_Stats.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    n = 1

    csv.each do |stats|
      stats = stats.to_hash

      puts "----stats " + n.to_s
      p stats

      player = nil
      name = stats['name'].downcase
      team_abbreviation = stats['team_abbreviation']
      stats.delete("name")
      stats.delete("team_abbreviation")

      player = Player.find_by name: name

      if player == nil 

        puts n.to_s + " player not found!!!"
        attributes = {
          name: name.downcase,
          display_name: name,
          position: "DST",
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
        stats["player"] = player
        StatForD.create(stats)
        puts n.to_s + " stats created!!"
      end

      n += 1
    end
        
  end



end
