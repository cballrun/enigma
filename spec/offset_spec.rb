require './offset'
require 'date'

describe Offset do
  before :each do
    @offset = Offset.new
  end

  it 'exists' do
    expect(@offset).to be_a(Offset)
  end

  it 'has a date' do
    expect(@offset.date).to be_a(Date)
  end

  it 'can properly format the date' do
    expect(@offset.date_format.length).to eq(6)
    expect(@offset.date_format.class).to eq(String)
  end

  it 'can square the date and produce an integer' do
    
    expect(@offset.square).to be_a(Integer)
    expect(@offset.square).to eq(2582875684)
  end

  it 'can take the last four digits of a squared date' do
    expect(@offset.last_four_digits).to eq("5684")
  end

  it 'can find the A offset' do
    
    expect(@offset.a_offset).to eq(5)
  end

  it 'can find the B offset' do

    expect(@offset.b_offset).to eq(6)
  end

  it 'can find the C offset' do
    expect(@offset.c_offset).to eq(8)
  end

  it 'can find the D offset' do
    expect(@offset.d_offset).to eq(4)
  end




end