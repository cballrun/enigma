require './key'

describe Key do
  before :each do
    @key = Key.new
  end

  it 'exists' do
    expect(@key).to be_a(Key)
  end

  xit 'has 5 digits' do
    expect(@key.length).to eq(5)
  end





end