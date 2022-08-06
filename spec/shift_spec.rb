require './key'
require './offset'
require './shift'

describe Shift do
  before :each do
    @shift = Shift.new("02715", "040895")
  end

  xit 'exists' do
    expect(@shift).to be_a(Shift)
  end

  it 'has a key' do
    expect(@shift.key).to eq("02715")
  end

  it 'has a date to generate offests' do
    expect(@shift.date).to eq("040895")
  end

  xit 'can make a shifts hash with the right values' do
    expect(@shift.shifts).to be_a(Hash)
    expect(@shift.shifts).to eq({A => 3, B=> 27, C => 73, D => 20} )
  end











end
