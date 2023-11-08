# Pn = n(3n-1)/2

def penta(n)
  (n * (3 * n - 1) / 2)
end

$pentarray = (1..3_003_000).map { |i| penta(i) }
# p $pentarray

found = []
def find_thing(n)
  for a in (1..n) do
    for b in (1..a) do
      flag = 0
      j = penta(a)
      k = penta(b)
      # print [a,b,j,k,j-k,j+k].join(" ")
      # puts
      if $pentarray.include?(j - k)
        flag += 1
        puts 'hi'
        print [a, b, j, k, j - k, j + k].join(' ')
        puts
      end

      if $pentarray.include?(j + k)
        flag += 1
        puts 'yo'
        print [a, b, j, k, j - k, j + k].join(' ')
        puts

      end
      next unless flag == 2

      puts '***************'
      print [a, b, j, k, j - k, j + k].join(' ')
      puts
      found << [a, b]
      File.open('penta.txt', 'a') do |f|
        f.puts [a, b, j, k, j - k, j + k].join(' ')
      end

    end

  end
end

def find2(_n)
  found = []
  for a in (0..$pentarray.length - 1) do
    for b in (0..a) do
      # print a, " "b,"|"
      flag = 0
      j = $pentarray[a]
      k = $pentarray[b]
      # print [a,b,j,k,j-k,j+k].join(" ")
      # puts
      if $pentarray.include?(j - k)
        flag += 1
        puts 'hi'
        print [a, b, j, k, j - k, j + k].join(' ')
        puts
      end

      if $pentarray.include?(j + k)
        flag += 1
        puts 'yo'
        print [a, b, j, k, j - k, j + k].join(' ')
        puts

      end
      next unless flag == 2

      puts '***************'
      found << [j, k]
      print [a, b, j, k, j - k, j + k].join(' ')
      puts
    end

  end
  puts 'FOUND'
  p found
end

p find2(10)
# p find_thing(100)
