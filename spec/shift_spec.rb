require './key'
require './offset'
require './shift'

describe Shift do
  before :each do
    @shift = Shift.new(Key.new("021715"), Offset.new)
  end

  it 'exists' do
    expect(@shift).to be_a(Shift)
  end

  it 'has a key' do
    expect(@shift.key).to be_a(Key)
  end

  it 'has an offset' do
    expect(@shift.offset).to be_a(Offset)
  end

  it 'can make a shifts hash with the right values' do
    expect(@shift.shifts).to be_a(Hash)
    require 'pry';binding.pry
    expect(@shift.shifts).to eq({A => 3, B=> 27, C => 73, D => 20} )
  end











end
