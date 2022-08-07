require 'date'

class Enigma
  

  def initialize

  end


  def encrypt(message, key = nil, date = Date.today)
    use_key = Key.new(key)
    offset = Offset.new(date)
    shift = Shift.new(use_key, offset) 
    encryption = Encryption.new(message, shift)
    encryption_hash = Hash.new
    encryption_hash[:encryption] = encryption.encrypt_message
    encryption_hash[:key] = key
    if date.class == String
      
      encryption_hash[:date] = date
    else
      encryption_hash[:date] = offset.date_format
    end
    encryption_hash
  end

  def decrypt(message, key = nil, date = Date.today)
    use_key = Key.new(key)
    offset = Offset.new(date)
    shift = Shift.new(use_key, offset) 
    decryption = Decryption.new(message, shift)
    decryption_hash = Hash.new
    decryption_hash[:decryption] = decryption.decrypt_message
    decryption_hash[:key] = key
    if date.class == String
      decryption_hash[:date] = date
    else
      decryption_hash[:date] = offset.date_format
    end
    decryption_hash
  end


end