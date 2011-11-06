if ARGV.count != 2
  puts "Usage: grep_check.rb <pattern_to_search> <in/file/name/or/path>"
  puts "Example grep_check.rb author sample.txt"
  exit 0;
end

pattern_to_search = ARGV[0]
file_to_search = ARGV[1]
if FileTest.exist? file_to_search then
  puts "Searching for pattern #{pattern_to_search} in #{file_to_search}......."
  line_number = 0;
  pattern_found = false
  input_file = File.open(file_to_search, "r") do |content|
    while line_string = content.gets
      line_number = line_number + 1
      if line_string.include?(pattern_to_search)
        puts "#{line_number} #{line_string}"
        pattern_found = true if !pattern_found
      end
    end
  end
  puts "Pattern not found in the specified file" if !pattern_found
  input_file.close
else
  puts "File does not exist"
end