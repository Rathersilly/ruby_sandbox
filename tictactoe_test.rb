# this needs a lot of work
require 'minitest/autorun'
require 'tictactoe'
require 'colorize'

class TestGame < Minitest::Test
  # Unit tests
  # Define your tests as methods beginning with test_.
  class Game
    attr_accessor @grid, @gameover

    puts 'game'.green
    p self
    def set_grid(array)
      @grid = array
      @grid = [['X', 'X', 'X'],
               [' ', ' ', ' '],
               [' ', ' ', ' ']]
    end
  end

  def setup
    g = Game.new
    g.instance_variables.each do |var|
      g.attr_accessor var
    end
  end

  def teardown; end

  def test_add; end

  def test_check_horiz
    array = [['X', 'X', 'X'],
             [' ', ' ', ' '],
             [' ', ' ', ' ']]
    g.set_grid arrray
    g.check_horiz
    assert
  end

  describe 'MyMath' do
    before do
      @a = [1, 2, 3]
      @x = 1
      @y = 3
    end

    it 'should add' do
      sum = MyMath.add(@x, @y)
      _(sum).must_equal 5
    end

    it 'should return itself' do
      # b = @a.my_each { |x| x += 2 }
      # _(b.object_id).must_equal @a.object_id
    end
  end
end
