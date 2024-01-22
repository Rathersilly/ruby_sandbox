# Insertion Sort
# traverse array - if current element (key) is smaller than the preceding element,
# traverse backward until you fig a smaller element than key. move the greater
# elements up one index and place key in array
require_relative 'sort_debug_helpers'

# def insertion_sort(a)
def insertion_sort_described(a)
  memo = a.dup
  puts 'Traverse array until memo[i] > memo[i+1]'.light_green
  (0..memo.size - 2).each do |i|
    # find element thats smaller than prev
    puts "Loop #{i}".col(1).light_magenta
    if memo[i + 1] > memo[i]
      puts 'skipping'
      puts Debug.locals(binding).bold.light_cyan
      next
    end

    j = i
    puts 'memo[i] > memo[i+1]!  Comparing:'.col(1).light_green
    key = memo[j + 1]

    puts "indexes: #{j}, #{j + 1}".col(2).bold.light_yellow
    puts "values:  #{memo[j]}, #{memo[j + 1]}".col(2).light_yellow
    # find memo's place
    print 'Before shift:   '.col(2)
    puts Debug.locals(binding).bold.light_cyan
    # print_locals(binding)
    while memo[j] > key
      # puts "BREAK MB: #{memo[j]} < #{key}, j: #{j}"
      # break if j == 0 || memo[j] < key

      puts 'WHILE'
      puts "memo[#{j}]: #{memo[j]}, key: #{key}".col(3)

      # shift element up
      memo[j + 1] = memo[j]
      print 'Shifting array: '.col(2)
      puts Debug.locals(binding).light_cyan

      j -= 1
      break if j < 0

    end
    puts "Emplacing key: #{key} at index #{j + 1}".col(2)
    memo[j + 1] = key
    print 'After shift:    '.col(2)
    puts Debug.locals(binding).bold.light_cyan
  end
  memo
end

def insertion_sort(array)
  memo = array.dup
  (0..memo.size - 2).each do |i|
    # find element thats smaller than prev
    next if memo[i + 1] >= memo[i]

    j = i
    key = memo[j + 1]
    # find memo's place
    while memo[j] > key
      memo[j + 1] = memo[j]
      j -= 1
      break if j < 0
    end
    memo[j + 1] = key
  end
  memo
end

def insertion_sort2(array)
  memo = array.dup
  (1..memo.size - 1).each do |i|
    # find element thats smaller than prev
    next if memo[i] >= memo[i - 1]

    j = i
    key = memo[j]
    # find memo's place
    while memo[j - 1] > key
      memo[j] = memo[j - 1]
      j -= 1
      break if j - 1 < 0
    end
    memo[j] = key
  end
  memo
end

def sort(array)
  insertion_sort2 array
end
arr = (1..50).to_a.shuffle
arr = (1..50).to_a.reverse
arr = (1..5).to_a.shuffle
arr = (1..5).to_a.reverse
arr = (1..5).to_a.shuffle
arr = [4, 1, 3, 2, 5]

# sorted = insertion_sort_described(arr)
sorted = sort(arr)
p arr
p sorted
