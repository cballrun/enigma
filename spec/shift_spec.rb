require './key'
require './offset'
require './shift'
require 'timecop'

describe Shift do
  before :each do
    key = Key.new("02715")
    test_date = Timecop.travel(1995, 8, 4)
    offset = Offset.new(test_date)
    @shift = Shift.new(key, offset)
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
    expect(@shift.shifts).to eq({:A => 3, :B=> 27, :C => 73, :D => 20} )
  end
end