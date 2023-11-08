require 'colorize'
require 'minitest/autorun'
class Meme
  def i_can_has_cheezburger?
    'OHAI!'
  end

  def will_it_blend?
    'YES!'
  end
end

class MemeAsker
  def initialize(meme)
    @meme = meme
  end

  def ask(question)
    method = question.tr(' ', '_') + '?'
    @meme.__send__(method)
  end
end

class TestMeme < Minitest::Test
  def setup
    @meme = Meme.new
  end

  def test_that_kitty_can_eat
    assert_equal 'OHAI!', @meme.i_can_has_cheezburger?
  end

  def test_that_it_will_not_blend
    refute_match(/^no/i, @meme.will_it_blend?)
  end

  def test_that_will_be_skipped
    skip 'test this later'
  end
end

describe 'MemeAsker', :ask do
  # describe MemeAsker, :ask do
  describe 'when passed an unpunctuated question' do
    it 'should invoke the appropriate predicate method on the meme' do
      puts 'hi'.green
      @meme = Minitest::Mock.new
      @meme_asker = MemeAsker.new @meme
      @meme.expect :will_it_blend?, :return_value

      @meme_asker.ask 'will it blend'
      @meme_asker.ask 'will it blend'

      @meme.verify
    end
  end
end
