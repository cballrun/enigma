require './lib/enigma'
require './lib/key'
require './lib/offset'
require './lib/shift'
require './lib/encryption'

class Encrypt
  
  message = File.open("message.txt").read
  enigma = Enigma.new
  encrypted_message = enigma.encrypt(message)
  
  File.write(("encrypted.txt"), encrypted_message[:encryption])

  puts "Created encrypted.txt with the key #{encrypted_message[:key]} and the date #{encrypted_message[:date]}"

end