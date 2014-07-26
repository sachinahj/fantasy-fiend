# load './app/helpers/application_helper.rb'

require 'csv'

module ApplicationHelper
  class CSV_Converter
    def self.from_rankings
      csv_text = File.read('app/assets/CSVs/rankings.csv')
      csv = CSV.parse(csv_text, :headers => true)
      n = 1
      csv.each do |row|
        row = row.to_hash

        p "row " + n.to_s
        row['name'] = row['name'].downcase
        p row

        a = Player.create(row)
        n += 1 
      end
    end

    def self.from_qb_projections
      csv_text = File.read('app/assets/CSVs/projections/QB_projections.csv')
      csv = CSV.parse(csv_text, :headers => true)
      n = 1
      # csv.each do |row|
      row = csv.first
        row = row.to_hash

        puts "----row " + n.to_s
        p row

        a = Player.find_by name: row['name'].downcase
        puts "----player found?"
        p a
        n += 1
      # end
    end


  end
end

# ApplicationHelper::CSV_Converter.from_rankings
ApplicationHelper::CSV_Converter.from_qb_projections