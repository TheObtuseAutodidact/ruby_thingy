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

    it "should format zipcode to five digits and pad with '0's as needed" do 
        p = CSVParser.new
        expect(p.format_zip("0")).to eq("00000")
        expect(p.format_zip("123456")).to eq("12345")
        expect(p.format_zip("12")).to eq("00012")
        expect(p.format_zip("12345")).to eq("12345")
    end

    it "should upcase a name string" do
        p = CSVParser.new
        expect(p.upcase_name("lenny")).to eq("LENNY")
        expect(p.upcase_name("株式会社スタジオジブリ")).to eq("株式会社スタジオジブリ")
    end

end