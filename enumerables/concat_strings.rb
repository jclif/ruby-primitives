def concatenate(array)
  array.inject('') do |accum, x|
    accum + x
  end
end

p concatenate(["a","b","c","d"])