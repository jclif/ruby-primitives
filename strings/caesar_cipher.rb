def caesar(str,num)
  letters = ("a".."z").to_a
  str_a = str.split("")
  str_a.map! do |x|
    if letters.index(x) + num > 26
      letters[letters.index(x) + num - 26]
    else
      letters[letters.index(x) + num]
    end
  end
  str_a.join("")
end