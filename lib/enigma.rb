class Enigma
  

  def initialize

  end

  def encrypt(message, key = nil, date = nil)
    use_key = Key.new(key)
    offset = Offset.new(date)
    shift = Shift.new(use_key, offset) 
    encryption = Encryption.new(message, shift)
    encryption_hash = Hash.new
    encryption_hash[:encryption] = encryption.encrypt_message
    encryption_hash[:key] = key
    encryption_hash[:date] = date
    encryption_hash
  end
end