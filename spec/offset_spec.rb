require './offset'

describe Offset do
  before :each do
    @offset = Offset.new
  end

  it 'exists' do
    expect(@offest).to be_a(Offset)
  end

  xit 'has a date' do
    expect(@offset.date).to be_a(Date)
  end

  xit 'can properly format the date' do
    expect(@offset.date_format.length).to eq(6)
    expect(@offset.date_format.class).to eq(String)

  end




end