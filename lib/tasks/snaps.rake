namespace :snaps do

  desc "import_snaps_csvs"
  task setup: :environment do

    Rake::Task["snaps:qb"].invoke
    Rake::Task["snaps:rb"].invoke
    Rake::Task["snaps:wr"].invoke
    Rake::Task["snaps:te"].invoke

  end

  desc "import qb snaps from 2013 season"
  task qb: :environment do

    csv_text = File.read('app/assets/CSVs/2013stats/snaps/qb_snaps.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    n = 1

    csv.each do |snap|
      snap = snap.to_hash

      puts "----qb snap " + n.to_s + " ----"
      p snap

      player = nil
      name = snap['name'].downcase
      snap.delete("name")
      snap.delete("team_abbreviation")
      snap.delete("rank")
      snap.delete("position")

      player = Player.find_by name: name

      if player == nil 
        puts n.to_s + " player not found!!!"
      else 
        puts n.to_s + " player found!!!"
        player.season2013_stat.update(snap)
        puts n.to_s + " snap created!!"
      end

      n += 1
    end

  end

  desc "import rb snaps from 2013 season"
  task rb: :environment do

    csv_text = File.read('app/assets/CSVs/2013stats/snaps/rb_snaps.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    n = 1

    csv.each do |snap|
      snap = snap.to_hash

      puts "----rb snap " + n.to_s + " ----"
      p snap

      player = nil
      name = snap['name'].downcase
      snap.delete("name")
      snap.delete("team_abbreviation")
      snap.delete("rank")
      snap.delete("position")

      player = Player.find_by name: name

      if player == nil 
        puts n.to_s + " player not found!!!"
      else 
        puts n.to_s + " player found!!!"
        player.season2013_stat.update(snap)
        puts n.to_s + " snap created!!"
      end

      n += 1
    end

  end

  desc "import wr snaps from 2013 season"
  task wr: :environment do

    csv_text = File.read('app/assets/CSVs/2013stats/snaps/wr_snaps.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    n = 1

    csv.each do |snap|
      snap = snap.to_hash

      puts "----wr snap " + n.to_s + " ----"
      p snap

      player = nil
      name = snap['name'].downcase
      snap.delete("name")
      snap.delete("team_abbreviation")
      snap.delete("rank")
      snap.delete("position")

      player = Player.find_by name: name

      if player == nil 
        puts n.to_s + " player not found!!!"
      else 
        puts n.to_s + " player found!!!"
        player.season2013_stat.update(snap)
        puts n.to_s + " snap created!!"
      end

      n += 1
    end

  end

  desc "import te snaps from 2013 season"
  task te: :environment do

    csv_text = File.read('app/assets/CSVs/2013stats/snaps/te_snaps.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    n = 1

    csv.each do |snap|
      snap = snap.to_hash

      puts "----te snap " + n.to_s + " ----"
      p snap

      player = nil
      name = snap['name'].downcase
      snap.delete("name")
      snap.delete("team_abbreviation")
      snap.delete("rank")
      snap.delete("position")

      player = Player.find_by name: name

      if player == nil 
        puts n.to_s + " player not found!!!"
      else 
        puts n.to_s + " player found!!!"
        player.season2013_stat.update(snap)
        puts n.to_s + " snap created!!"
      end

      n += 1
    end

  end

end
