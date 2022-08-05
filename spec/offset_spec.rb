require './offset'
require 'date'

describe Offset do
  before :each do
    @offset = Offset.new
  end

  it 'exists' do
    expect(@offset).to be_a(Offset)
  end

  it 'can properly format the date' do
    expect(@offset.date.length).to eq(6)
    expect(@offset.date.class).to eq(String)
  end

  it 'can square the date and produce an integer' do
    
    
    expect(@offset.date.square).to be_a(Integer)
    expect(@offset.date.square).to eq(2582875684)
  end




end