require './encryption'
require './shift'

describe Encryption do
  before :each do
    key = Key.new("02715")
    date = Timecop.freeze(1995, 8, 4)
    offset = Offset.new(date)
    @shift = Shift.new(key, offset)
    @encryption = Encryption.new("hello world")
  end

  it 'exists' do
    expect(@encryption).to be_a(Encryption)
  end

  it 'has a message' do
    expect(@encryption.message).to eq("hello world")
  end

  it 'has an alphabet' do
    expect(@encryption.alphabet). to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end




end