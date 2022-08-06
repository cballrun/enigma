class Key
  
  attr_reader :test_key

  def initialize(test_key = nil)
    @test_key = test_key
  end

  def keygen
    number = rand(99999).to_s
    number.rjust(5, "0")
  end

  def a_key
    test_key[0..1].to_i
  end

  def b_key
    test_key[1..2].to_i
  end

  def c_key
    test_key[2..3].to_i
  end

  def d_key
    test_key[3..4].to_i
  end





end