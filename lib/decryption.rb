require './lib/alphabetable'
require './lib/splitable'

class Decryption
  include Alphabetable
  include Splitable

  attr_reader :message,
              :shift

  def initialize(message, shift)
    @message = message
    @shift = shift
  end

  def decrypt_letter_a(letter)
    position = alphabet_with_index[letter]
    shift_1 = shift.shifts[:A]
    rotate_amount = position - shift_1 
    new_letter = alphabet.rotate(rotate_amount).first
  end

  def decrypt_letter_b(letter)
    position = alphabet_with_index[letter]
    shift_1 = shift.shifts[:B]
    rotate_amount = position - shift_1 
    new_letter = alphabet.rotate(rotate_amount).first
  end

  def decrypt_letter_c(letter)
    position = alphabet_with_index[letter]
    shift_1 = shift.shifts[:C]
    rotate_amount = position - shift_1 
    new_letter = alphabet.rotate(rotate_amount).first
  end

  def decrypt_letter_d(letter)
    position = alphabet_with_index[letter]
    shift_1 = shift.shifts[:D]
    rotate_amount = position - shift_1 
    new_letter = alphabet.rotate(rotate_amount).first
  end


  def decrypt_message
    decrypted_message = ""
    chars_split.map do|chars|
      chars.each_with_index do |char, index|
        if !alphabet_with_index.include?(char)
          decrypted_message << char
        elsif index == 0
          decrypted_message << decrypt_letter_a(char)
        elsif index == 1
          decrypted_message << decrypt_letter_b(char)
        elsif index == 2
          decrypted_message << decrypt_letter_c(char)
        elsif index == 3
          decrypted_message << decrypt_letter_d(char)
        end
      end
    end
    decrypted_message
  end





end