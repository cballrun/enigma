require './lib/enigma'
require './lib/key'
require './lib/offset'
require './lib/shift'
require './lib/encryption'

class Encrypt
  
  message = File.open(ARGV[0]).read
  enigma = Enigma.new
  encrypted_message = enigma.encrypt(message)
  

  File.write((ARGV[0]), encrypted_message[:encryption])

  puts "Created #{ARGV[1]} with the key #{encrypted_message[:key]} and the date #{encrypted_message[:date]}"

end