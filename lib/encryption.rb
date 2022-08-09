require './lib/alphabetable'
require './lib/splitable'

class Encryption
  include Alphabetable
  include Splitable

  attr_reader :message,
              :shift

  def initialize(message, shift)
    @message = message
    @shift = shift
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

  def encrypt_message
    encrypted_message = ""
    chars_split.map do|chars|
      chars.each_with_index do |char, index|
        if !alphabet_with_index.include?(char.downcase)
          encrypted_message << char
        elsif index == 0
          encrypted_message << encrypt_letter_a(char.downcase)
        elsif index == 1
          encrypted_message << encrypt_letter_b(char.downcase)
        elsif index == 2
          encrypted_message << encrypt_letter_c(char.downcase)
        elsif index == 3
          encrypted_message << encrypt_letter_d(char.downcase)
        end
      end
    end
    encrypted_message
  end
end