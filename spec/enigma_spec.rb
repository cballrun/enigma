require './enigma'
require './encryption'
require './decryption'
require 'timecop'

describe Enigma do
  before :each do
    Timecop.return
    @enigma = Enigma.new
  end

  it 'exists' do
    expect(@enigma).to be_a(Enigma)
  end

  it 'can encrypt a message with a key and given date' do
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq(
      {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      })
  end

  it 'can decrypt a message with a given key and given date' do
    expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq(
      {
        decryption: "hello world",
        key: "02715",
        date: "040895"
      })
  end

  it 'can encrypt a message with a given key and todays date' do
    encrypted = @enigma.encrypt("hello world", "02715")
    expect(encrypted).to eq(
      {
        encryption: "okjdvfugyrb",
        key: "02715",
        date: "090822"
      })
  end

  it 'can decrypt a message with a key and todays date' do
    encrypted = @enigma.encrypt("hello world", "02715")
    expect(@enigma.decrypt(encrypted[:encryption], "02715")).to eq(
      {
        decryption: "hello world",
        key: "02715",
        date: "090822"
      })
  end

  it 'can encrypt a message with a random key and todays date' do 
    encrypted = @enigma.encrypt("hello world")
    expect(encrypted[:date]).to eq("090822")
    expect(encrypted[:encryption].length).to eq(11)
    expect(encrypted[:key].length).to eq(5)
  end
end