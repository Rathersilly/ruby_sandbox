require 'colorize'

class Player
  attr_accessor :name, :token

  def initialize(token)
    @token = token
  end
end

class Game
  def ii
    puts caller[0]
    p caller
  end

  def initialize
    ii
    @grid = Array.new(3) do
      Array.new(3, ' ')
    end
    p @grid
    @xplayer = Player.new('X')
    @yplayer = Player.new('O')
    @current_player = @xplayer
    @gameover = false
    @winner = nil
  end

  def run
    ii
    warn 'run'

    loop do
      coord = get_input

      place_token(coord, @current_player.token)
      print_grid
      check_gameover
      swap_players
      break if @gameover == true
    end
    puts "#{@winner.token} wins!"
    puts 'Thanks for playing!'
  end

  def check_gameover
    check_tie
    check_win
  end

  def check_tie
    return if @grid.flatten.include? ' '

    puts 'TIE GAME'
    @gameover = true
  end

  def check_win
    check_horiz
    check_vert
    check_diag
  end

  def check_horiz
    ii
    @grid.each do |row|
      p row
      p row.all? @xplayer.token
      if row.all? @xplayer.token
        @winner = @xplayer
        @gameover = true
        return
      elsif row.all? @xplayer.token
        @winner = @yplayer
        @gameover = true
        return
      end
    end
    false
  end

  def check_vert
    @grid.transpose.each do |col|
      if col.all? @xplayer.token
        @winner = @xplayer
        @gameover = true
      elsif col.all? @xplayer.token
        @winner = @yplayer
        @gameover = true
      end
    end
  end

  def check_diag
    # flag = nil
    # (0..2).each do |i|
    #   flag ||= @grid[i][i]
    #   if grid[i][i] !!
    #   end
  end

  def string_to_coord(s)
    s.split(',').map(&:to_i)
  end

  def get_input
    input = ''
    loop do
      puts "Player #{@current_player.token}, enter row,col: "
      input = gets.chomp
      exit if input == 'q'
      p input
      break if validate(input)
    end # until validate(input)
    string_to_coord(input)
  end

  def validate(coord_string)
    puts 'FDSF'.yellow
    p coord_string
    unless coord_string.match?(/[0-2],[0-2]/)
      puts 'Input unacceptable!'
      return false
    end
    x, y = string_to_coord(coord_string)
    if @grid[x][y] != ' '
      puts 'Square taken!'
      return false
    end
    true
  end

  def swap_players
    @current_player = if @current_player == @xplayer
                        @yplayer
                      else
                        @xplayer
                      end
  end

  def place_token(arr, token)
    ii
    p arr
    p token
    @grid[arr[0]][arr[1]] = token
  end

  def print_grid
    @grid.each_index do |i|
      @grid[i].each_index do |j|
        print @grid[i][j]
        if j < 2
          print '|'
        elsif j == 2
          puts
        end
      end
      puts '-----' if i < 2
    end
  end
end
g = Game.new
# g.print_grid
g.run

