require './ll.rb'
describe LL do
  # need basic lists of size 0, 1, n
  before do
    @l0 = LL.new
    @l1 = LL.new
    @l1.append(1)
    @l2 = LL.new
    10.times { |i| @l2.append(i) }
    @lists = [@l0,@l1,@l2]
  end
    
  it 'should append to list' do
    @l0.append(4)
    @l1.append(4)
    @l2.append(4)
    @lists.each { |l| l.show}

    @lists.each { |l| puts l.tail.value}
    puts "*******"
    expect(@l0.tail.value).to eq(4)
    expect(@l1.tail.value).to eq(4)
    expect(@l2.tail.value).to eq(4)
  end
  it 'should prepend to list' do
    @l0.prepend(4)
    @l1.prepend(4)
    @l2.prepend(4)
    expect(@l0.head.value).to eq(4)
    expect(@l1.head.value).to eq(4)
    expect(@l2.head.value).to eq(4)
  end
  it 'should pop things' do
    expect(@l0.pop).to eq(nil)
    expect(@l1.pop).to eq(1)
    expect(@l2.pop).to eq(9)
  end

end
