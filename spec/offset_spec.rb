require './offset'
require 'date'
require 'timecop'


describe Offset do
  before :each do
    date = Timecop.freeze(1995, 8, 4)
    @offset = Offset.new(date)
    
  end

  it 'exists' do

    expect(@offset).to be_a(Offset)
  end

  it 'can properly format the date' do
    expect(@offset.date_format.length).to eq(6)
    expect(@offset.date_format.class).to eq(String)
  end

  it 'can square the date and produce an integer' do
    
    expect(@offset.square).to be_a(Integer)
    expect(@offset.square).to eq(1672401025)
  end

  it 'can take the last four digits of a squared date' do
    expect(@offset.last_four_digits).to eq("1025")
  end

  it 'can find the A offset' do
    
    expect(@offset.a_offset).to eq(1)
  end

  it 'can find the B offset' do

    expect(@offset.b_offset).to eq(0)
  end

  it 'can find the C offset' do
    expect(@offset.c_offset).to eq(2)
  end

  it 'can find the D offset' do
    expect(@offset.d_offset).to eq(5)
  end




end