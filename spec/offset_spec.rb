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




end