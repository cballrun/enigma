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
  
        # if chars[0] == char
        #   encrypted_message << encrypt_letter_a(char)
        # elsif chars[1] == char
        #   encrypted_message << encrypt_letter_b(char)
        # elsif chars[2] == char
        #   encrypted_message << encrypt_letter_c(char)
        # elsif chars[3] == char
          
        #   encrypted_message << encrypt_letter_d(char)
        
        # end
        
   
      

 


  def chars_index
    chars_index_hash = Hash.new([])
    chars_split.map do |chars|
      chars.each_with_index do |letter, index|
        chars_index_hash["#{index}".to_i] += ["#{letter}"]
      end
    end
    chars_index_hash
  end

  # def encrypt_characters
  #   a_chars = chars_index[0].flat_map do |char|
  #     encrypt_letter_a(char)
  #   end

  #   b_chars = chars_index[1].flat_map do |char|
  #     encrypt_letter_b(char)
  #   end
  #   c_chars = chars_index[2].flat_map do |char|
  #     encrypt_letter_c(char)
  #   end
  #   d_chars = chars_index[3].flat_map do |char|
  #     encrypt_letter_d(char)
  #   end
  #   encrypted_char_array = (a_chars + b_chars + c_chars + d_chars)
  # end

  # def encrypt_message
  #   encrypted_char_array = encrypt_characters
  #   require 'pry'
  #   encrypted_message = ""
  #   encrypted_char_array.each do |char|
  #     encrypted_message << encrypted_char_array[0] 
  #     encrypted_char_array.rotate!(3)
  #  end
  #  encrypted_message
  # end



end