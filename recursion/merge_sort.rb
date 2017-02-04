def merge_sort(array)
  return array if array.size < 2
  half = array.size / 2
  left_half = merge_sort(array[0..half-1])
  right_half = merge_sort(array[half..-1])

  current_array = []

  while left_half.size > 0 && right_half.size > 0
    if left_half[0] < right_half[0]
      current_array << left_half.shift
    else
      current_array << right_half.shift
    end
  end
  return current_array + left_half + right_half
end

puts merge_sort([4,8,3,5,52,0,13])


