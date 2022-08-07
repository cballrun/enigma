class Encryption
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def alphabet
    ("a".."z").to_a << " "  
  end

  def alphabet_with_index
    require 'pry';binding.pry
    index_hash = Hash.new(0)
    alphabet.each_with_index do |letter, index|
      index_hash["#{letter}"] = "#{index}".to_i
    end
    index_hash
  end
  



end