def num_to_s(num, base)
  digits = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"]
  answer = []
  until num == 0
    answer << digits[num % base]
    num = num/base
  end
  answer.reverse.join("")
end