class Encryption
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def alphabet
    ("a".."z").to_a << " "  
  end

  





end