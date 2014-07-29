namespace :adp do

  desc "import qb projected draft positions from qb_adp.csv"
  task setup: :environment do

    Rake::Task["adp:qb"].invoke
    Rake::Task["adp:rb"].invoke
    Rake::Task["adp:wr"].invoke
    Rake::Task["adp:te"].invoke
    Rake::Task["adp:k"].invoke
    Rake::Task["adp:dst"].invoke

  end


  desc "import qb projected draft positions from qb_adp.csv"
  task qb: :environment do

    csv_text = File.read('app/assets/CSVs/2014adp/qb_adp.csv')
    csv = CSV.parse(csv_text, :headers => true)
    n = 1
    csv.each do |draft|
      draft = draft.to_hash
      draft['name'] = draft['display_name'].downcase

      p "----qb draft " + n.to_s + " ----"
      p draft

      player = Player.new(draft)
      player.save

      n += 1
    end

  end

  desc "import rb projected draft positions from rb_adp.csv"
  task rb: :environment do

    csv_text = File.read('app/assets/CSVs/2014adp/rb_adp.csv')
    csv = CSV.parse(csv_text, :headers => true)
    n = 1
    csv.each do |draft|
      draft = draft.to_hash
      draft['name'] = draft['display_name'].downcase

      p "----rb draft " + n.to_s + " ----"
      p draft

      player = Player.new(draft)
      player.save

      n += 1
    end

  end

  desc "import wr projected draft positions from wr_adp.csv"
  task wr: :environment do

    csv_text = File.read('app/assets/CSVs/2014adp/wr_adp.csv')
    csv = CSV.parse(csv_text, :headers => true)
    n = 1
    csv.each do |draft|
      draft = draft.to_hash
      draft['name'] = draft['display_name'].downcase

      p "----wr draft " + n.to_s + " ----"
      p draft

      player = Player.new(draft)
      player.save

      n += 1
    end

  end

  desc "import te projected draft positions from te_adp.csv"
  task te: :environment do

    csv_text = File.read('app/assets/CSVs/2014adp/te_adp.csv')
    csv = CSV.parse(csv_text, :headers => true)
    n = 1
    csv.each do |draft|
      draft = draft.to_hash
      draft['name'] = draft['display_name'].downcase

      p "----te draft " + n.to_s + " ----"
      p draft

      player = Player.new(draft)
      player.save

      n += 1
    end

  end

  desc "import k projected draft positions from k_adp.csv"
  task k: :environment do

    csv_text = File.read('app/assets/CSVs/2014adp/k_adp.csv')
    csv = CSV.parse(csv_text, :headers => true)
    n = 1
    csv.each do |draft|
      draft = draft.to_hash
      draft['name'] = draft['display_name'].downcase

      p "----k draft " + n.to_s + " ----"
      p draft

      player = Player.new(draft)
      player.save

      n += 1
    end

  end

  desc "import dst projected draft positions from dst_adp.csv"
  task dst: :environment do

    csv_text = File.read('app/assets/CSVs/2014adp/dst_adp.csv')
    csv = CSV.parse(csv_text, :headers => true)
    n = 1
    csv.each do |draft|
      draft = draft.to_hash
      draft['name'] = draft['display_name'].downcase

      p "----dst draft " + n.to_s + " ----"
      p draft

      player = Player.new(draft)
      player.save

      n += 1
    end

  end

end
