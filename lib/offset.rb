class Offset
  attr_reader :date

  def initialize
    @date = Date.today
  end

  def date_format
   date.strftime('%d%m%y')
  end

  def square
    int_date = date_format.to_i
    int_date * int_date
  end



end