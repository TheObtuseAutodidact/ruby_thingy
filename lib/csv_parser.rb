require 'csv'


class CSVParser

    def parse(file ="spec/fixtures/single_line.csv" )
        handle = CSV.foreach(file, {:headers => true, header_converters: :symbol}) #, encoding: 'iso-8859-1:utf-8'})
        handle.each do |row|
            puts(row.inspect)
            puts(row[:zip])
        end
    end

    def convert_time(time_string="") # default argument protects form wrong num of arguments error
        # assume all dates are 20XX; compensate for two digit dates by adding 2000 years
        # strptime didn't like "/"
        time_string.gsub!("/","-")
        begin
            (DateTime.strptime(time_string, '%m-%d-%Y %l:%M:%S').next_year(2000) - (3.0/24.0)).iso8601()
        rescue ArgumentError => e 
            # TODO: Log error
            puts("TODO: log (#{e}) to STDERR and do not record row")
        end
    end

    def format_zip(zip_string)
        # TODO: validate numericality 
        if zip_string.length > 5
            zip_string = zip_string.slice(0..4)
        else
            zip_string = zip_string.rjust(5, "0")
        end
        zip_string
    end

    def upcase_name(name_string)
        name_string.upcase
    end
end




# runner
csv_parser = CSVParser.new
csv_parser.parse("spec/fixtures/sample.csv")