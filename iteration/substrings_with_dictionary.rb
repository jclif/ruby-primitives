require_relative './substrings.rb'

def subwords(words)
  substring_array = substrings(words).map {|x|x.join("")}
  p substring_array
  dictionary_array = []
  File.foreach('dictionary.txt') do |line|
    dictionary_array << line.chomp
  end
  substring_array.select {|substring| dictionary_array.include?(substring)}
end

# p subwords('this')