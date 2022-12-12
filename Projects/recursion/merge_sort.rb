# frozen_string_literal: true

arr = [4, 8, 6, 2, 1, 7, 5, 3]

def merge_sort(arr)
  return arr if arr.length < 2

  left = merge_sort(arr[0..arr.length / 2 - 1])
  right = merge_sort(arr[arr.length / 2..arr.length])
  new_array = []
  left_count = 0
  right_count = 0
  while left_count < left.length && right_count < right.length
    if left[left_count] > right[right_count]
      new_array << right[right_count]
      right_count += 1
    else
      new_array << left[left_count]
      left_count += 1
    end
  end
  if left_count == left.length
    until right_count == right.length
      new_array << right[right_count]
      right_count += 1
    end
  else
    until left_count == left.length
      new_array << left[left_count]
      left_count += 1
    end
  end
  new_array
end

puts merge_sort(arr)
