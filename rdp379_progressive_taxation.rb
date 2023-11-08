# frozen_string_literal: true

# RDP [2019-07-15] Challenge #379 [Easy] Progressive taxation
# https://www.reddit.com/r/dailyprogrammer/comments/cdieag/20190715_challenge_379_easy_progressive_taxation/
# income cap      marginal tax rate
$tax_hash = {
  10_000 => 0.00,
  30_000 => 0.10,
  100_000 => 0.25,
  :highest => 0.40
}
#the amount between each bracket

def tax(income)
  total_tax = 0
  brackets = [0]
  $tax_hash.each_key { |k| brackets << k if k.is_a?(Numeric) }
  p brackets
  brackets.each_cons(2) do |a,b|
    if income > a
      total_tax += $tax_hash[b]
      
    end

    p a, b
  end


  




  puts "Income of #{income} pays a total of #{total_tax} in tax."
  total_tax
end

tax(56789)

if $PROGRAM_NAME == nil

  tax(0)
  tax(10_000)
  tax(10_009)
  tax(10_010)
  tax(12_000)
  tax(56_789)
  tax(1_234_567)
end
