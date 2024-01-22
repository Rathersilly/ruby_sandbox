# Bubble Sort
# traverse array, comparing adjacent elements and swapping
# so that the higher element is to the right.
# On^2

def swap(arr, i, j)
  t = arr[i]
  arr[i] = arr[j]
  arr[j] = t
  arr
end

def bubble_sort(array)
  max_unsorted_index = array.size - 1
  while max_unsorted_index > 0
    (0..max_unsorted_index - 1).each do |i|
      # swap array i, i + 1 if arrayi] > arrayi + 1]
      array[i], array[i + 1] = array[i + 1], array[i] if array[i] > array[i + 1]
    end
    max_unsorted_index -= 1
  end
  array
end

arr = (1..10).to_a.shuffle

p arr
p bubble_sort(arr)
arr = (1..10).to_a.reverse
p bubble_sort(arr)
