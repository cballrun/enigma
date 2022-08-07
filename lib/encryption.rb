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
    message.scan /\w/
  end

  def chars_split
    message_split.each_slice(4).to_a
  end

  def chars_index
    chars_index_hash = Hash.new([])
    chars_split.map do |chars|
      chars.each_with_index do |letter, index|
        chars_index_hash["#{index}".to_i] += ["#{letter}"]
      end
    end
    chars_index_hash
  end

  def encrypt_characters
    a_chars = chars_index[0].flat_map do |char|
      encrypt_letter_a(char)
    end

    b_chars = chars_index[1].flat_map do |char|
      encrypt_letter_b(char)
    end
    c_chars = chars_index[2].flat_map do |char|
      encrypt_letter_c(char)
    end
    d_chars = chars_index[3].flat_map do |char|
      encrypt_letter_d(char)
    end
    
    require 'pry';binding.pry
  end

  def encrypt_message
    encrypted_char_array = encrypt_characters
    
    encrypted_message = ""
    encrypted_char_array.each do |char|
      encrypted_message << encrypted_char_array[0] 
      encrypted_char_array.rotate!(3)
   end
   encrypted_message
  end



end