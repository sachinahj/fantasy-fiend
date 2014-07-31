def create_players(position)

  csv_text = File.read('app/assets/CSVs/2014dp/'+position+'_dp.csv')
  csv = CSV.parse(csv_text, :headers => true)
  n = 1
  csv.each do |draft|
    draft = draft.to_hash
    draft['name'] = draft['display_name'].downcase

    p "----" + position + " draft " + n.to_s + " ----"
    p draft

    player = Player.new(draft)
    player.save

    n += 1
  end   

end


namespace :dp do

  desc "import_dp_csvs"
  task setup: :environment do

    Rake::Task["dp:qb"].invoke
    Rake::Task["dp:rb"].invoke
    Rake::Task["dp:wr"].invoke
    Rake::Task["dp:te"].invoke
    Rake::Task["dp:k"].invoke
    Rake::Task["dp:dst"].invoke

  end


  desc "import qb projected draft positions from qb_adp.csv"
  task qb: :environment do

    create_players('qb')

  end

  desc "import rb projected draft positions from rb_adp.csv"
  task rb: :environment do

    create_players('rb')

  end

  desc "import wr projected draft positions from wr_adp.csv"
  task wr: :environment do

    create_players('wr')

  end

  desc "import te projected draft positions from te_adp.csv"
  task te: :environment do

    create_players('te')

  end

  desc "import k projected draft positions from k_adp.csv"
  task k: :environment do

    create_players('k')

  end

  desc "import dst projected draft positions from dst_adp.csv"
  task dst: :environment do

    create_players('dst')

  end

end
