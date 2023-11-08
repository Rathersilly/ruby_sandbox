require 'benchmark'

Benchmark.bm 10 do |bench|
  bench.report "Hash: " do
    5_000_000.times do { name: "John Smith", age: 45 } end
  end

  bench.report "Struct: " do
    klass = Struct.new(:name, :age)
    5_000_000.times do klass.new("John Smith", 45) end
  end

end

