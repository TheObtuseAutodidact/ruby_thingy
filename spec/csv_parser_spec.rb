require "rspec"
require "csv_parser"

describe CSVParser do
    it "should be a CSVParser" do
        p = CSVParser.new
        expect(p.class).to eq(CSVParser)  
    end

    it "should convert datetime string" do
        p = CSVParser.new
        expect(p.convert_time("10/2/04 8:44:11 AM")).to eq("2004-10-02T05:44:11+00:00")
    end

    it "should log an error if it fails to parse date" do
        p = CSVParser.new
        expect(p.convert_time("10/?/04 8:44:11 AM")).to eq(nil);

    end

    
    skip "should log an error if it fails to parse date" do
        p = CSVParser.new
        expect(p.convert_time()).to eq(nil);
    end
end