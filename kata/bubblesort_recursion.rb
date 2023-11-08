# frozen_string_literal: true

def bubblesort(arr)
  # loop through array, find biggest, put at end
  # sort in place or create new array
  return arr if arr.size == 1

  biggest = arr[0]
  big_index = 0
  arr.size.times do |i|
    if biggest < arr[i]
      biggest = arr[i]
      big_index = i
    end
  end
  sorted = arr[0...big_index] + arr[big_index + 1..-1] + [biggest]
  sorted = bubblesort(sorted[0..-2])+ [sorted[-1]]
end

arr = Array.new(10) { |i| i }.shuffle
p arr

sorted = bubblesort(arr)
p sorted
