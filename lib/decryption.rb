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

  def decrypt_letter(shift_id, letter)
    position = alphabet_with_index[letter]
    shift_value = shift.shifts[shift_id]
    rotate_amount = position - shift_value
    new_letter = alphabet.rotate(rotate_amount).first
  end

  def decrypt_message
    decrypted_message = ""
    chars_split.map do|chars|
      chars.each_with_index do |char, index|
        if !alphabet_with_index.include?(char)
          decrypted_message << char
        elsif index == 0
          decrypted_message << decrypt_letter(:A, char)
        elsif index == 1
          decrypted_message << decrypt_letter(:B, char)
        elsif index == 2
          decrypted_message << decrypt_letter(:C, char)
        elsif index == 3
          decrypted_message << decrypt_letter(:D, char)
        end
      end
    end
    decrypted_message
  end
end