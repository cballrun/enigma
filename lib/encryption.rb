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
  
  def encrypt_letter_a(letter)
    position = alphabet_with_index[letter]
    shift_1 = shift.shifts[:A]
    rotate_amount = position + shift_1
    new_letter = alphabet.rotate(rotate_amount).first
  end

  def encrypt_letter_b(letter)
    position = alphabet_with_index[letter]
    shift_1 = shift.shifts[:B]
    rotate_amount = position + shift_1
    new_letter = alphabet.rotate(rotate_amount).first
  end

  def encrypt_letter_c(letter)
    position = alphabet_with_index[letter]
    shift_1 = shift.shifts[:C]
    rotate_amount = position + shift_1
    new_letter = alphabet.rotate(rotate_amount).first
  end

  def encrypt_letter_d(letter)
    position = alphabet_with_index[letter]
    shift_1 = shift.shifts[:D]
    rotate_amount = position + shift_1
    new_letter = alphabet.rotate(rotate_amount).first
  end

  def message_split
    message.chars
  end

  def chars_split
    message_split.each_slice(4).to_a
  end

  def encrypt_message
    encrypted_message = ""
    chars_split.map do|chars|
      chars.each_with_index do |char, index|
        if index == 0
          encrypted_message << encrypt_letter_a(char)
        elsif index == 1
          encrypted_message << encrypt_letter_b(char)
        elsif index == 2
          encrypted_message << encrypt_letter_c(char)
        elsif index == 3
          encrypted_message << encrypt_letter_d(char)
        end
      end
    end
    encrypted_message
  end
end