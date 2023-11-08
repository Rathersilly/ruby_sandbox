# frozen_string_literal: true

# usage: rspec mergesort.rb

require './mergesort'
describe 'merge' do
  it 'merges 2 arrays' do
    a = [1, 4, 7]
    b = [2, 3, 9]
    expect(merge(a, b)).to eq([1, 2, 3, 4, 7, 9])
  end
  it 'merges with 1 empty' do
    a = []
    b = [5]
    expect(merge(a, b)).to eq([5])
  end
end

describe 'merge_sort' do
  it 'sorts reversed array' do
    array = (1..10).to_a.reverse
    expect(merge_sort(array)).to eq((1..10).to_a)
  end
  it 'sorts even size array' do
    array = (1..18).to_a.shuffle
    expect(merge_sort(array)).to eq((1..18).to_a)
  end
  it 'sorts odd size array' do
    array = (1..13).to_a.shuffle
    expect(merge_sort(array)).to eq((1..13).to_a)
  end
end
