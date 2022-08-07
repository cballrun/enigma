require './alphabetable'

class Decryption
  include Alphabetable

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






end