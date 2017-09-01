require 'csv'

class CSVParser

    def parse(file ="spec/fixtures/single_line.csv" )
        handle = CSV.foreach(file, {:headers => true, header_converters: :symbol, encoding: 'iso-8859-1:utf-8'})
        handle.each do |row|
            puts(row.inspect)
        end
    end
end


# runner
csv_parser = CSVParser.new
csv_parser.parse("spec/fixtures/sample.csv")