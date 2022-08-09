require './encryption'
require './shift'

describe Encryption do
  before :each do
    key = Key.new("02715")
    test_date = Timecop.travel(1995, 8, 4)
    offset = Offset.new(test_date)
    shift = Shift.new(key, offset)
    @encryption = Encryption.new("hello world", shift)
    @encryption_2 = Encryption.new("!HeLlO wOrLd!", shift)
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

  it 'can encrypt a letter with each shift' do
    expect(@encryption.encrypt_letter_a("h")).to eq("k")
    expect(@encryption.encrypt_letter_b("e")).to eq("e")
    expect(@encryption.encrypt_letter_c("l")).to eq("d")
    expect(@encryption.encrypt_letter_d("l")).to eq("e")
  end

  it 'can split a message into an array of characters' do
    expect(@encryption.message_split).to eq(["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"])
    expect(@encryption_2.message_split).to eq(["!", "H", "e", "L", "l", "O", " ", "w", "O", "r", "L", "d", "!"])
  end

  it 'can split a message array into sub arrays' do
    expect(@encryption.chars_split).to be_a(Array)
    expect(@encryption.chars_split).to eq([["h", "e", "l", "l"], ["o", " ", "w", "o"], ["r", "l", "d"]])
    expect(@encryption_2.chars_split).to eq([["!", "H", "e", "L"], ["l", "O", " ", "w"], ["O", "r", "L", "d"], ["!"]])
  end

  it 'can encrypt a message containing characters not in the alphabet index' do
    expect(@encryption.encrypt_message).to eq("keder ohulw")
    expect(@encryption_2.encrypt_message).to eq("!hxeoosprrdx!")
  end
end