require './key'

describe Key do
  before :each do
    @key = Key.new("02715")
    @key_1 = Key.new
  end

  it 'exists' do
    expect(@key).to be_a(Key)
    expect(@key_1).to be_a(Key)
  end

  it 'can initialize with a predefined test key' do
    expect(@key.test_key).to eq("02715")
  end

  it 'can create a random 5 digit number as a string' do #.format for leading zeroes/string padding? or ljust/rjust?
    expect(@key.keygen.length).to eq(5)
    expect(@key.keygen.class).to eq(String)
    expect(@key_1.keygen.length).to eq(5)
    expect(@key_1.keygen.class).to eq(String)
  end

  xit 'has an a key' do
    expect(@key.a_key).to eq(02)
  end

  xit 'has an b key' do
    expect(@key.b_key).to eq(27)
  end

  xit 'has an c key' do
    expect(@key.c_key).to eq(71)
  end

  xit 'has an d key' do
    expect(@key.d_key).to eq(15)
  end










end