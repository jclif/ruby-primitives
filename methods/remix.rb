def remix(drinks_array)
  alcohol_array = []
  mixer_array = []
  drinks_array.each do |drink|
    alcohol_array << drink[0]
    mixer_array << drink[1]
  end
  alcohol_array.shuffle!
  mixer_array.shuffle!
  new_drinks = []
  alcohol_array.length.times do |index|
    new_drinks << [alcohol_array[index],mixer_array[index]]
  end
  new_drinks
end

# p remix([
#   ["rum", "coke"],
#   ["gin", "tonic"],
#   ["scotch", "soda"]
# ])

# Partial karma for bonus?

# def remix(drinks_array)
#   alcohol_array = []
#   mixer_array = []
#   drinks_array.each do |drink|
#     alcohol_array << drink[0]
#     mixer_array << drink[1]
#   end
#   alcohol_array.shuffle!
#   mixer_array.shuffle!
#   new_drinks = []
#   alcohol_array.length.times do
#     while drinks_array.include?([alcohol_array.last, mixer_array.last])
#       alcohol_array.shuffle!
#       mixer_array.shuffle!
#     end
#     new_drinks << [alcohol_array.pop,mixer_array.pop]
#   end
#   new_drinks
# end