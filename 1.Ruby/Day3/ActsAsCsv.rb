class CsvParser

  attr_accessor :row_data, :row_header
  def initialize(file_name)
    @row_header = []
    @row_data = []
    parse(file_name)
  end
  
  def parse (file_name)
    file = File.new(file_name, "r") 
    @row_header = csv_string_to_array(file.gets.downcase)
    line_number = 0
    while (line = file.gets)
      line_number = line_number + 1
      @row_data << CsvRow.new(line_number, csv_string_to_hash(line))
    end
    file.close
  end
  
  private
  def csv_string_to_array(csv_string)
    arr = csv_string.split(',')
    arr.each{|ele| ele.strip!}
    arr
  end
  
  def csv_string_to_hash(csv_string)
    array = csv_string_to_array(csv_string)
    array_to_hash(array)
  end
      
  def array_to_hash (array)
    hash = Hash.new
    @row_header.each_index do |i|
      hash[@row_header[i]] = array[i]
    end
    hash
  end
end

class CsvRow
  def initialize (row_num, data)
    @row_number = row_num
    @row_data = data
  end
  
  def method_missing(parameter, *args)
    if @row_data.member? parameter.to_s then
      @row_data[parameter.to_s]
    else
     "#{parameter} was not present in the CSV file"
    end
  end
  
end

csv_handle = CsvParser.new("data.csv")
csv_handle.row_data.each {|csv_row|
  puts "#{csv_row.name}, aged #{csv_row.age}, lives in #{csv_row.location}"
}