require './key'

describe Key do
  before :each do
    @key = Key.new
  end

  it 'exists' do
    expect(@key).to be_a(Key)
  end

  it 'can create a random 5 digit number as a string' do
    expect(@key.keygen.length).to eq(5)
    expect(@key.keygen.class).to eq(String)
  end








end