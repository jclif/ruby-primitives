def shuffler(filename)
  lines_array = File.readlines(filename)
  File.open("#{filename}-shuffled.txt", 'w') do |f|
    lines_array.shuffle.each do |line|
      f.puts line
    end
  end
end

shuffler('dictionary.txt')