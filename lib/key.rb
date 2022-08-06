class Key
  
  attr_reader :test_key

  def initialize(test_key = nil)
    @test_key = test_key
  end

  def keygen
    number = rand(99999).to_s
    number.rjust(5, "0")
  end




end