def create_draft_position(position)


      csv_text = File.read('app/assets/CSVs/2014dp/' + position + '_dp.csv')
      csv = CSV.parse(csv_text, :headers => true)
      
      n = 1

      csv.each do |draft_position|
        draft_position = draft_position.to_hash

        puts "----" + position + " draft_position " + n.to_s + " ----"
        p draft_position

        player = nil
        name = draft_position['name'].downcase
        team_abbreviation = draft_position['team_abbreviation']
        draft_position.delete("name")
        draft_position.delete("team_abbreviation")
        draft_position.delete("rank")
        draft_position.delete("position")

        player = Player.where(name: name.downcase).where(team_abbreviation: team_abbreviation).first

        if player == nil 
          puts n.to_s + " player not found!!!"
        else 
          puts n.to_s + " player found!!!"
          player.update(draft_position)
          puts n.to_s + " draft_position created!!"
        end

        n += 1
      end  

  # csv_text = File.read('app/assets/CSVs/2014dp/'+position+'_dp.csv')
  # csv = CSV.parse(csv_text, :headers => true)
  # n = 1
  # csv.each do |draft|
  #   draft = draft.to_hash
  #   draft['name'] = draft['display_name'].downcase

  #   p "----" + position + " draft " + n.to_s + " ----"
  #   p draft

  #   player = Player.new(draft)
  #   player.save

  #   n += 1
  # end   

end


namespace :draft_positions do

  desc "import_dp_csvs"
  task setup: :environment do

    Rake::Task["draft_positions:qb"].invoke
    Rake::Task["draft_positions:rb"].invoke
    Rake::Task["draft_positions:wr"].invoke
    Rake::Task["draft_positions:te"].invoke
    Rake::Task["draft_positions:k"].invoke
    Rake::Task["draft_positions:dst"].invoke

  end


  desc "import qb projected draft positions from qb_dp.csv"
  task qb: :environment do

    create_draft_position('qb')

  end

  desc "import rb projected draft positions from rb_dp.csv"
  task rb: :environment do

    create_draft_position('rb')

  end

  desc "import wr projected draft positions from wr_dp.csv"
  task wr: :environment do

    create_draft_position('wr')

  end

  desc "import te projected draft positions from te_dp.csv"
  task te: :environment do

    create_draft_position('te')

  end

  desc "import k projected draft positions from k_dp.csv"
  task k: :environment do

    create_draft_position('k')

  end

  desc "import dst projected draft positions from dst_dp.csv"
  task dst: :environment do

    create_draft_position('dst')

  end

end
