def calc(exp)
  mult_re = %r{(?<lval>\d+)(?<op>[*/])(?<rval>\d+)}
  add_re = /(?<lval>\d+)(?<op>[+-])(?<rval>\d+)/
  # print "Please enter expression: "
  #
  # exp = gets.chomp
  tokens = []
  res = 0

  order = Enumerator.new do |y|
    y << :bracket
    y << :mult
    y << :add
  end
  # Parse expression; fill tokens array with the tokens
  # start with just each character as token
  # tokens = exp.split('')
  # puts tokens

  # tokens = "3*6+2*7+8+2-6"#.split('')
  tokens = exp.dup
  # parsing loop
  i = 0
  status = order.next
  status = order.next
  loop do
    puts "loop: #{i}, evaluating #{status}, expression is currently: #{tokens}"
    # search for brackets
    # search for * or /
    # if you find one, use that operator on the left and right values

    m = tokens.match(mult_re)
    status = order.next if m.nil? && status == :mult
    if status == :mult
      break if m.nil?

      case m[:op]
      when '*'
        res = m[:lval].to_i * m[:rval].to_i
      when '/'
        res = m[:lval].to_i / m[:rval].to_i
      end
      tokens.sub!(mult_re, res.to_s)
    elsif status == :add
      m = tokens.match(add_re)
      break if m.nil?

      case m[:op]
      when '+'
        res = m[:lval].to_i + m[:rval].to_i
      when '-'
        res = m[:lval].to_i - m[:rval].to_i
      end
      tokens.sub!(add_re, res.to_s)
    end
    i += 1
    break if tokens == ''
  end
  puts "#{exp} = #{res}"
  res
end

calc('3*6+2*7')
calc('3-7-9')
calc('3*6+2*7+8+2-6')
