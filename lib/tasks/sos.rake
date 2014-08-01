namespace :sos do
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
          p team
          sos.delete(:team)
          team = Team.find_by(team: team)
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

  end
end
