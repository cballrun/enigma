require './decryption'
require './shift'

describe Decryption do
  before :each do
    @key = Key.new("02715")
    @test_date = Timecop.travel(1995, 8, 4)
    @offset = Offset.new(@test_date)
    @shift = Shift.new(@key, @offset)
    @decryption = Decryption.new("keder ohulw", @shift)
  end

  it 'exists' do
    expect(@decryption).to be_a(Decryption)
  end

  it 'has a message' do
    expect(@decryption.message).to eq("keder ohulw")
  end

  it 'has a shift' do
    expect(@decryption.shift).to be_a(Shift)
  end

  it 'has an alphabet' do
    expect(@decryption.alphabet). to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end

  it 'can index the alphabet' do
    expect(@decryption.alphabet_with_index).to eq({"a" => 0,
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

  it 'can decrypt a one letter message with the a shift' do
    expect(@decryption.decrypt_letter_a("k")).to eq("h")
  end
  
  it 'can decrypt a one letter message with the b shift' do
    expect(@decryption.decrypt_letter_b("e")).to eq("e")
  end

  it 'can decrypt a one letter message with the c shift' do
    expect(@decryption.decrypt_letter_c("d")).to eq("l")
  end

  it 'can decrypt a one letter message with the d shift' do
   expect(@decryption.decrypt_letter_d("e")).to eq("l")
  end

  it 'can split a message into an array of characters' do
    expect(@decryption.message_split).to eq(["k", "e", "d", "e", "r", " ", "o", "h", "u", "l", "w"])
  end

  it 'can split a message array into sub arrays' do
    expect(@decryption.chars_split).to be_a(Array)
    expect(@decryption.chars_split).to eq([["k", "e", "d", "e"], ["r", " ", "o", "h"], ["u", "l", "w"]])
  end


  it 'can decrypt a message' do
    expect(@decryption.decrypt_message).to eq("hello world")
  end
end