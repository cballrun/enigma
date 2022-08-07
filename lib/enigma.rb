class Enigma
  

  def initialize

  end

  def encrypt(message, key = nil, date = nil)
    key = Key.new(key)
    offset = Offset.new(date)
    shift = Shift.new(key, offset) 
    encryption = Encryption.new(message, shift)
    encryption_hash = Hash.new
    encryption_hash[:encryption] = encryption.encrypt_message
    require 'pry';binding.pry
  end
end