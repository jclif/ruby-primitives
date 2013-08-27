def substrings(string)
  substrings = []
  string_array = string.split("")
  string_array.length.times do |first|
    first.upto(string_array.length - 1) do |last|
      substrings << string_array[first..last]
    end
  end
  substrings
end

# p substrings("cat")