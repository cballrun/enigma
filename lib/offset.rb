class Offset
  attr_reader :date

  def initialize(date)
    @date = date
  end

  def date_format
   date.strftime('%d%m%y')
  end

  def square
    if date.class == String
      int_date = date.to_i
      int_date * int_date
    else 
      int_date = date_format.to_i
      int_date * int_date
    end
  end

  def last_four_digits
    square.to_s[-4..-1]
  end

  def a_offset
    last_four_digits[0].to_i
  end
  
  def b_offset
    last_four_digits[1].to_i
  end

  def c_offset
    last_four_digits[2].to_i
  end

  def d_offset
    last_four_digits[3].to_i
  end





end