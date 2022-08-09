require './lib/enigma'
require './lib/key'
require './lib/offset'
require './lib/shift'
require './lib/encryption'

message = File.open(ARGV[0]).read
enigma = Enigma.new
encrypted_message_hash = enigma.encrypt(message)
  
File.write((ARGV[1]), encrypted_message_hash[:encryption])

puts "Created #{ARGV[1]} with the key #{encrypted_message_hash[:key]} and the date #{encrypted_message_hash[:date]}"