require 'minitest/autorun'
require './cipher_vigenere'

# things we could test:
# basic functionality
# string contents - whitespace weird chars, etc
# string length/existence
class VigTest < Minitest::Test
  def setup
    @message = 'yoyoyowhatsupdudes'
    @key = 'kitten'
  end

  def test_encrypts_and_decrypts
    encrypted = vig_encrypt(@message, @key)
    assert encrypted != @message
    decrypted = vig_decrypt(encrypted, @key)
    assert decrypted == @message
    assert_equal decrypted, @message
  end
end

describe self do
  before do
    @message = 'helpimtrappedinacomputer'
    @keys = []
  end

  describe 'vig encrypt' do
    it 'should encrypt and decrypt' do
      alpha = ('a'..'z').to_a
      20.times do |_i|
        key = ''
        rand(1..10).times { |_j| key += alpha.sample }
        @keys << key
      end
      20.times do |i|
        processed = vig_decrypt(vig_encrypt(@message, @keys[i]), @keys[i])
        _(processed).must_equal @message
      end
    end
  end
end
