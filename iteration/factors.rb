def factors(number)
  factors = []
  1.upto(number) do |factor|
    factors << factor if number % factor == 0
  end
  factors
end

p factors(8)
p factors (13)