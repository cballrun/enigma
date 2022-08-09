require './lib/enigma'
require './lib/key'
require './lib/offset'
require './lib/shift'
require './lib/decryption'

message = File.open(ARGV[0]).read
enigma = Enigma.new
decrypted_message_hash = enigma.decrypt(message, ARGV[2], ARGV[3])
  
File.write((ARGV[1]), decrypted_message_hash[:decryption])

puts "Created #{ARGV[1]} with the key #{ARGV[2]} and the date #{ARGV[3]}"
