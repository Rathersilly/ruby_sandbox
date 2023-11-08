require 'benchmark'
require 'minitest/autorun'
require './vig'
require './vig2'

describe VigSugar do
  before do
    @msg = 'heyhowsitgoingoverthere'
    @key = 'abcxyz'
  end

  it 'should encode and decode' do
    # assert_equal(vigd(vige(@msg,@key),@key), @msg)
    _(VigSugar.vigd(VigSugar.vige(@msg, @key), @key)).must_equal @msg
  end
end
describe VigClean do
  before do
    @msg = 'heyhowsitgoingoverthere'
    @key = 'abcxyz'
  end

  describe 'vige and vigd' do
    it 'should encode and decode' do
      assert_equal(VigClean.vigd(VigClean.vige(@msg, @key), @key), @msg)
    end
  end
  describe 'vig (with method arg)' do
    it 'should encode and decode with the 3 arg method' do
      _(VigClean.vig(VigClean.vig(@msg, @key, method: :encrypt),
                     @key, method: :decrypt)).must_equal @msg
      # _(1).must_equal 2
    end
  end
end
n = 5000
Benchmark.bmbm do |x|
  x.report('Clean #vig') do
    @msg = 'heyhowsitgoingoverthere'
    @key = 'abcxyz'
    cipher = VigClean.vig(@msg, @key, method: :encrypt)
    decode = VigClean.vig(cipher, @key, method: :decrypt)
  end
  x.report('Clean #vige and #vigd') do
    @msg = 'heyhowsitgoingoverthere'
    @key = 'abcxyz'
    cipher = VigClean.vige(@msg, @key)
    decode = VigClean.vigd(cipher, @key)
  end

  x.report('Sugar') do
    @msg = 'heyhowsitgoingoverthere'
    @key = 'abcxyz'
    cipher = VigSugar.vige(@msg, @key)
    decode = VigSugar.vigd(cipher, @key)
  end
end
