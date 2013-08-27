def stock_picker(array)
  best = [0,0]
  best_days = []
  array.each_with_index do |x,i|
    (i+1).upto(array.length-1) do |k|
      if best[1]-best[0] < array[k] - x
        best = [x,array[k]]
        best_days = [i, k]
      end
    end
  end
  p best
  best_days
end


