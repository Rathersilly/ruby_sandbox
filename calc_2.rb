#   Expression:
#     Term
#     Expression "+" Term
#     Expression "-" Term
#   Term:
#     Primary
#     Term "*" Primary
#     Term "/" Primary
#     Term "%" Primary
#   Primary:
#     Number
#     "(" Expression ")"
#   Number:
#     floating-point-literal
# can use string#scan to turn exp into array of tokens

class Calc
  def initialize; end

  def tokenize(string)

    tokens = string.scan(%r{(-(?!\d)|\(|\)|[+*/]|-?\d+)\s*})
    tokens.flatten!.delete("")
    tokens
  end

  def calc(string)
    non_nums = "[+-*\/]"
    #@tokens = string.scan(%r{(-(?!\d)|\(|\)|[+*/]|-?\d+)\s*})  # => 
    # @tokens = string.scan(%r{(\
    #                           ((?<![0-9\)]\s*)-)\
    #                           (?!\d)|\(|\)|[+*/]|-?\d+)\s*})
    @tokens = tokenize(string)
    puts "@tokens: #{@tokens.inspect}"
    #@tokens.flatten!
    puts "@tokens: #{@tokens.inspect}"

    @exp = string
    @index = 0

    expression
  end

  def get_token
    t = peek_token
    @index += 1
    t
  end

  def peek_token
    t = @tokens[@index]
    # t = @exp[@index]
    t = t.to_i if t =~ /\d/
    t
  end
  def burn_token
    @index += 1
  end

  def expression
    left = term
    t = peek_token
    puts "in exp: #{left} #{t}"
    #while ['+', '-'].include?(t)
    while true
      t = peek_token
      puts "loop exp: #{left} #{t}"
      return left if t.nil?
      if t == ')'
        burn_token
        return left
      end
      case t
      when '+'
        t = get_token
        left += term
      when '-'
        t = get_token
        left -= term
      else 
        puts "ret exp: #{left}"
        return left
      end
    end
  end

  def term
    left = primary
    t = peek_token
    puts "in term: #{left} #{t}"
    #while ['*', '/'].include?(t)
    while true
      t = peek_token
      puts "loop term: #{left} #{t}"
      case t
      when '*'
        t = get_token
        left *= primary
      when '/'
        t = get_token
        left /= primary
      else
        puts "ret term: #{left}"
        return left
      end
    end
  end

  def primary
    left = get_token
    t = peek_token
    puts "in prim: #{left} #{t}"
    # If left is (, primary needs to return an expression
    # otherwise, it needs to just return token
    if left == '('
      return expression
      
    else
      return left.to_f
    end

  end

  def number
    get_token
  end
end
exp = '1+2+3'
exp = '1-2-4'
[exp = '3*3-2*5']
exp = '2--4+6*6 + 6/-3'
exp = '3-7-9'
exp = '2+3'
exp = '1+2+3'
exp = '(3 + 4) *2'
exp = '2+4*2+5/5'  #11

exp = '(3+4)*2 - 1* 4 / -3 * 7 - -3-1 - (-4 - -5)' #24.333
exp = '(3+4)*2 - 1* 4 / -3 * 7 - -3-1 - (-4 - -5)' #24.333
c = Calc.new
p c.calc(exp)
