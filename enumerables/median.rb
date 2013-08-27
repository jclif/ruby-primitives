def median(array)
  if array.length.even?
    return (array.sort[array.length/2].to_f + array.sort[array.length/2-1])/2
  else
    return (array.sort[array.length/2])
  end
end