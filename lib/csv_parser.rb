require 'csv'


class CSVParser

    def parse(file ="spec/fixtures/single_line.csv" )

        CSV.open("cleaned_file.csv", "w") do |csv|
            csv << ["Timestamp", "Address", "ZIP", "FullName",
                "FooDuration", "BarDuration", "TotalDuration" ,"Notes"] # headers

            handle = CSV.foreach(file, {:headers => true, header_converters: :symbol, encoding: 'iso-8859-1'})
            handle.each do |row|
                row[:timestamp] = convert_time(row[:timestamp]).scrub
                row[:address] = row[:address].scrub # working?
                row[:zip] = format_zip(row[:zip]).scrub
                row[:fullname] = upcase_name(row[:fullname]).scrub
                row[:fooduration] = calc_duration(row[:fooduration])
                row[:barduration] = calc_duration(row[:barduration])
                row[:totalduration] = row[:fooduration] + row[:barduration]
                row[:notes] = row[:notes].scrub if row[:notes]

                csv.puts(row)
            end
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

    def calc_duration(duration_string)
        duration_nums = duration_string.split(":")
        hours_to_seconds = duration_nums[0].to_i * 60 * 60
        minutes_to_seconds = duration_nums[1].to_i * 60
        seconds = duration_nums[2].to_f
        hours_to_seconds + minutes_to_seconds + seconds
    end
end




# runner
csv_parser = CSVParser.new
csv_parser.parse("spec/fixtures/sample-with-broken-utf8.csv")