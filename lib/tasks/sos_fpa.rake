namespace :sos_fpa do

  desc "import strength of schedule from FantasyPros.com"
  task setup: :environment do
    Rake::Task["sos_fpa:sos"].invoke
    Rake::Task["sos_fpa:fpa"].invoke

  end

  desc "import strength of schedule from FantasyPros.com"
  task sos: :environment do
    doc = Nokogiri::HTML(open("http://www.fantasypros.com/nfl/strength-of-schedule.php"))
    # puts doc
    table = doc.css('table.table-condensed td')
    # puts table

    sos = {}
    table.each_with_index do |row, index|
      column = index % 9
      case column 
      when 0
        if index != 0
          p sos
          team = sos[:team]
          sos.delete(:team)
          team = Team.find_by(team: team)
          p team
          team.update(sos)
          team.save
        end
        sos = {team: row.text}  
      when 1
        sos.merge!({sos_qb_rank: row.text.to_i})
      when 2
        sos.merge!({sos_qb_fpa: row.text.to_f})
      when 3
        sos.merge!({sos_rb_rank: row.text.to_i})
      when 4
        sos.merge!({sos_rb_fpa: row.text.to_f})
      when 5
        sos.merge!({sos_wr_rank: row.text.to_i})
      when 6
        sos.merge!({sos_wr_fpa: row.text.to_f})
      when 7
        sos.merge!({sos_te_rank: row.text.to_i})
      when 8
        sos.merge!({sos_te_fpa: row.text.to_f})
      else
        puts "nothing"
      end

    end
    
    Player.all.each do |pl|
      pl.update_sos
    end

  end

  desc "import fpa from FantasyPros.com"
  task fpa: :environment do
    doc = Nokogiri::HTML(open("http://www.fantasypros.com/nfl/points-allowed.php"))
    # puts doc
    table = doc.css('table.table-condensed td')
    # puts table

    fpa = {}
    table.each_with_index do |row, index|
      column = index % 9
      case column 
      when 0
        if index != 0
          p fpa
          team = fpa[:team]
          fpa.delete(:team)
          team = Player.find_by(name: team.downcase)
          p team
          team.season_stat.update(fpa)
          team.save
        end
        fpa = {team: row.text}  
      when 1
        fpa.merge!({fpa_qb_rank: row.text.to_i})
      when 2
        fpa.merge!({fpa_qb_fpa: row.text.to_f})
      when 3
        fpa.merge!({fpa_rb_rank: row.text.to_i})
      when 4
        fpa.merge!({fpa_rb_fpa: row.text.to_f})
      when 5
        fpa.merge!({fpa_wr_rank: row.text.to_i})
      when 6
        fpa.merge!({fpa_wr_fpa: row.text.to_f})
      when 7
        fpa.merge!({fpa_te_rank: row.text.to_i})
      when 8
        fpa.merge!({fpa_te_fpa: row.text.to_f})
      else
        puts "nothing"
      end

    end

  end
end
