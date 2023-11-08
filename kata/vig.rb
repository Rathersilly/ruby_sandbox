# really a fan of how concise this is.
# it doesnt benchmark super well though, mainly because
# of cycle i think
# Check out vig_test_bm.rb for info

module VigSugar
  class << self
    def offset(c, n)
      c = c.ord + n
      c -= 26 if c > 122
      c += 26 if c < 97
      c.chr
    end

    def vige(msg, s)
      s = s.split('').map { |c| c.ord - 96 }
      s = s.cycle.to_enum
      msg.chars.map { |c| offset(c, s.next) }.join
    end

    def vigd(msg, s)
      s = s.split('').map { |c| c.ord - 96 }
      s = s.cycle.to_enum
      msg.chars.map { |c| offset(c, -s.next) }.join
    end
  end
end

if __FILE__ == $0

  p VigSugar.vige('whyhellothere', 'orange')

  p VigSugar.vigd(VigSugar.vige('whyhellothere', 'orange'), 'orange')
  p VigSugar.vigd(VigSugar.vige('whyhellothere', 'orange'), 'blue')
end
