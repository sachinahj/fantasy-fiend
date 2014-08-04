def create_snaps(position)

  csv_text = File.read('app/assets/CSVs/2013stats/snaps/' + position + '_snaps.csv')
  csv = CSV.parse(csv_text, :headers => true)
  
  n = 1

  csv.each do |snap|
    snap = snap.to_hash

    puts "----" + position + " snap " + n.to_s + " ----"
    p snap

    player = nil
    name = snap['name'].downcase
    team_abbreviation = snap['team_abbreviation']
    snap.delete("name")
    snap.delete("team_abbreviation")
    snap.delete("rank")
    snap.delete("position")

    player = Player.where(name: name.downcase).first

    if player == nil 
      puts n.to_s + " player not found!!!"
    else 
      puts n.to_s + " player found!!!"
      player.season_stat.update(snap)
      puts n.to_s + " snap created!!"
    end

    n += 1
  end  

end


namespace :snaps do

  desc "import_snaps_csvs - update"
  task setup: :environment do

    Rake::Task["snaps:qb"].invoke
    Rake::Task["snaps:rb"].invoke
    Rake::Task["snaps:wr"].invoke
    Rake::Task["snaps:te"].invoke

  end

  desc "import qb snaps from 2013 season"
  task qb: :environment do

    create_snaps('qb')

  end

  desc "import rb snaps from 2013 season"
  task rb: :environment do

    create_snaps('rb')

  end

  desc "import wr snaps from 2013 season"
  task wr: :environment do

    create_snaps('wr')

  end

  desc "import te snaps from 2013 season"
  task te: :environment do

    create_snaps('te')

  end

end












