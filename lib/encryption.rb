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

  def encrypt_letter(shift_id, letter)
    position = alphabet_with_index[letter]
    shift_value = shift.shifts[shift_id]
    rotate_amount = position + shift_value
    new_letter = alphabet.rotate(rotate_amount).first
  end

  def encrypt_message
    encrypted_message = ""
    chars_split.map do|chars|
      chars.each_with_index do |char, index|
        if !alphabet_with_index.include?(char.downcase)
          encrypted_message << char
        elsif index == 0
          encrypted_message << encrypt_letter(:A, char.downcase)
        elsif index == 1
          encrypted_message << encrypt_letter(:B, char.downcase)
        elsif index == 2
          encrypted_message << encrypt_letter(:C, char.downcase)
        elsif index == 3
          encrypted_message << encrypt_letter(:D, char.downcase)
        end
      end
    end
    encrypted_message
  end
end