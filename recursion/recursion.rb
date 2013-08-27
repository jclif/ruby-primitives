require 'debugger'

def range(first,last)
  if first+1 == last
    return []
  else
    range(first,last-1) + [last - 1]
  end
end

class Array

  def rec_sum
    if self == []
      return 0
    else
      self[0..-2].rec_sum + self.last
    end
  end

  def it_sum
    i = 0
    sum = 0
    while i < self.length
      sum += self[i]
      i += 1
    end
    sum
  end

end

def exp1(base, pwr)
  if pwr == 0
    return 1
  else
    exp1(base, pwr - 1) * base
  end
end

def exp2(base, pwr)
  if pwr == 0
    return 1
  elsif pwr % 2 == 0
    exp2(base, pwr / 2) ** 2
  else
    base * (exp2(base, (pwr - 1) / 2) ** 2)
  end
end

def super_dup(el)
  unless el.is_a?(Array)
    begin
      return el.dup
    rescue
      return el
    end
  else
    array = []
    el.each do |x|
      array << super_dup(x)
    end
    return array
  end
end

# Derp
# def fib(n)
#   # debugger
#   array = []
#   0.upto(n-1) do |i|
#     array << fib_helper(i)
#   end
#
#   array
# end
#
# def fib_helper(n)
#   if n == 0
#     return 0
#   elsif n == 1
#     return 1
#   else
#     fib_helper(n-1) + fib_helper(n-2)
#   end
# end

def fib(n)
  if n == 0
    return [0]
  elsif n == 1
    return [0, 1]
  else
    fib(n-1) << fib(n-1)[-2] + fib(n-1)[-1]
  end
end

def bsearch(array, target)
  #debugger
  mid = array.length/2
  if target == array[mid]
    return mid
  elsif target > array[mid]
    mid + 1 + bsearch(array[(mid + 1)..-1], target)
  else
    bsearch(array[0..(mid - 1)], target)
  end
end

def make_change(amt,coins = [25, 10, 5, 1])
  # debugger
  if coins == [] || amt == 0
    return []
  else
    raise "No solution" unless coins.any?{|coin| amt % coin == 0}
    coins.sort!.reverse!
    i = 0
    until coins[i] < amt
      i += 1
    end
    amt_left = amt % coins[i]
    unless coins[i+1..-1].any?{|coin| amt_left % coin == 0} || coins[i+1..-1].empty?
      make_change(amt, coins[i+1..-1])
    else
      make_change(amt_left,coins[i+1..-1]) + ([coins[i]] * (amt / coins[i]))
    end
  end
end

class Array
  def merge_sort
    if self.length <= 1
      return self
    else
      mid = self.length/2
      left = self[0..(mid - 1)].merge_sort
      right = self[mid..-1].merge_sort
      # debugger
      array = []
      until left.empty? && right.empty?
        if left.empty?
          array << right.shift
        elsif right.empty?
          array << left.shift
        else
          if left.first < right.first
            array << left.shift
          else
            array << right.shift
          end
        end
      end
      array
    end
  end

  def subsets
    # debugger
    if self == []
      return [[]]
    else
      array = []
      self[0..-2].subsets.each do |subset|
        array << (subset + [self.last])
        array << subset
      end

      array
    end
  end

end