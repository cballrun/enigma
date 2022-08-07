class Encryption
  attr_reader :message,
              :shift

  def initialize(message, shift)
    @message = message
    @shift = shift
  end

  def alphabet
    ("a".."z").to_a << " "  
  end

  def alphabet_with_index
    index_hash = Hash.new(0)
    alphabet.each_with_index do |letter, index|
      index_hash["#{letter}"] = "#{index}".to_i
    end
    index_hash
  end
  
  def encrypt_letter_a
    position = alphabet_with_index[message]
    shift_1 = shift.shifts[:A]
    rotate_amount = position + shift_1
    new_letter = alphabet.rotate(rotate_amount).first
  end

  def encrypt_letter_b
    position = alphabet_with_index[message]
    shift_1 = shift.shifts[:B]
    rotate_amount = position + shift_1
    new_letter = alphabet.rotate(rotate_amount).first
  end

  def encrypt_letter_c
    position = alphabet_with_index[message]
    shift_1 = shift.shifts[:C]
    rotate_amount = position + shift_1
    new_letter = alphabet.rotate(rotate_amount).first
  end

  def encrypt_letter_d
    position = alphabet_with_index[message]
    shift_1 = shift.shifts[:D]
    rotate_amount = position + shift_1
    new_letter = alphabet.rotate(rotate_amount).first
  end

  def message_split
    message.scan /\w/
  end


end