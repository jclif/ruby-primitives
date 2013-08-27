def my_transpose(matrix)
  transposed = []
  matrix.each do |x|
    x.length.times do |i|
      if transposed[i]
        transposed[i] << x[i - 1]
      else
        transposed[i] = [x[i]]
      end
    end
  end
  transposed
end