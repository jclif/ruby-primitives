class Array
  def two_sum
    array = []
    self.each_with_index do |x, i|
      self[i+1...self.length].each_with_index do |y, k|
        if x + y == 0
          array << [i, k + i + 1]
        end
      end
    end
    array
  end
end

p [-1, 0, 2, -2, 1,4,5,-5].two_sum