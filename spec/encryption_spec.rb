require './encryption'
require './shift'

describe Encryption do
  before :each do
    @key = Key.new("02715")
    @date = Timecop.freeze(1995, 8, 4)
    @offset = Offset.new(@date)
    @shift = Shift.new(@key, @offset)
    @encryption = Encryption.new("hello world", @shift)
  end

  it 'exists' do
    expect(@encryption).to be_a(Encryption)
  end

  it 'has a message' do
    expect(@encryption.message).to eq("hello world")
  end

  it 'has a shift' do
    expect(@encryption.shift).to be_a(Shift)
  end

  it 'has an alphabet' do
    
    expect(@encryption.alphabet). to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end


  it 'can index the alphabet' do
    expect(@encryption.alphabet_with_index).to eq({"a" => 0,
      "b" => 1,
      "c" => 2,
      "d" => 3,
      "e" => 4,
      "f" => 5,
      "g" => 6,
      "h" => 7,
      'i' => 8,
      'j' => 9,
      'k' => 10,
      'l' => 11,
      'm' => 12,
      'n' => 13,
      'o' => 14,
      'p' => 15,
      'q' => 16,
      'r' => 17,
      's' => 18,
      't' => 19,
      'u' => 20,
      'v' => 21,
      'w' => 22,
      'x' => 23,
      'y' => 24,
      'z' => 25,
      " " => 26})
  end

  it 'can encrypt a one letter message with the a shift' do
    
    expect(@encryption.encrypt_letter_a("h")).to eq("k")
  end
  
  it 'can encrypt a one letter message with the b shift' do
    
    expect(@encryption.encrypt_letter_b("e")).to eq("e")
  end

  it 'can encrypt a one letter message with the c shift' do
    
    expect(@encryption.encrypt_letter_c("l")).to eq("d")
  end

  it 'can encrypt a one letter message with the d shift' do
   
    
    expect(@encryption.encrypt_letter_d("l")).to eq("e")
  end


  it 'can split a message into an array of characters' do
    expect(@encryption.message_split).to eq(["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"])
  end

  

  it 'can split a message array into sub arrays' do
    expect(@encryption.chars_split).to be_a(Array)
    expect(@encryption.chars_split).to eq([["h", "e", "l", "l"], ["o", " ", "w", "o"], ["r", "l", "d"]])
  end

  xit 'can enrypt the characters in the sub arraay' do
    
    expect(@encryption.chars_encrypt).to eq([["k", "e", "d", "e"], ["r", " ", "o", "h"], ["u", "l", "w"]])
  end

  xit 'can index the sub arrays 0..3' do
    
    expect(@encryption.chars_index).to be_a(Hash)
    expect(@encryption.chars_index).to eq({0=>["h", "o", "r"], 1=>["e", " ", "l"], 2=>["l", "w", "d"], 3=>["l", "o"]})
  end


  
  xit 'can encrypt the characters of a message' do
    expect(@encryption.encrypt_characters).to be_a(Array)
    expect(@encryption.encrypt_characters).to eq(["k", "r", "o", "e", "w", "d", "d", "g", "e", "k"])
  end

  it 'can encrypt a message' do
    
    expect(@encryption.encrypt_message).to eq("keder ohulw")
  end







end