require './enigma'
require './shift'
require './key'
require './encryption'
require './decryption'

describe Enigma do
  before :each do
    @key = Key.new("02715")
    @date = Timecop.freeze(1995, 8, 4)
    @offset = Offset.new(@date)
    require 'pry';binding.pry
    @shift = Shift.new(@key, @offset)
    @encryption = Encryption.new("hello world", @shift)
    @decryption = Decryption.new("keder ohulw", @shift)
    @enigma = Enigma.new
  end

  it 'exists' do
    expect(@enigma).to be_a(Enigma)
  end


  it 'can encrypt a message with a key and date' do
    
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq(
      {
           
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
         
      })
  end

  xit 'can decrypt a message with a key and date' do
    expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq(
    {

     decryption: "hello world",
     key: "02715",
     date: "040895"

    })
  end

  xit 'can encrypt a message with a key and todays date' do
    encrypted = @enigma.encrypt("hello world", "02715")
    expect(encrypted).to eq(
    {
           
      encryption: "keder ohulw",
      key: "02715",
      date: "070822"
         
    }
    )
  end

  xit 'can decrypt a message with a key and todays date' do
    encrypted = enigma.encrypt("hello world", "02715")
    expect(@enigma.decrypt(encrypted[:encryption], "02715")).to eq(
      {
  
       decryption: "hello world",
       key: "02715",
       date: "070822"
  
      })


  end

  xit 'can encrypt a message with a random key and todays date' do #not done
    encrypted = @enigma.encrypt("hello world")
    expect(encrypted).to eq(
    {
           
      encryption: "keder ohulw",
      key: "02715",
      date: "070822"
         
    }
    )
  end


end

