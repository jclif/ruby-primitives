def bubble_sort(original_numbers)
  numbers = original_numbers.dup
  numbers.length.times do |loop_count|
    (numbers.length - loop_count - 1).times do |position|
      if numbers[position] > numbers[position + 1]
        numbers[position],numbers[position+1] = numbers[position + 1],numbers[position]
      end
    end
  end
  numbers
end