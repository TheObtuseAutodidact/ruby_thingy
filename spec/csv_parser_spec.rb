require "rspec"
require "csv_parser"

describe CSVParser do
    it "should be a CSVParser" do
        p = CSVParser.new
        expect(p.class).to eq(CSVParser)  
    end
end