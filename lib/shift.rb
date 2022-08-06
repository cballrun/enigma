class Shift
  attr_reader :key, :offset

  def initialize(key, offset)
    @key = key
    @offset = offset
  end

  def shifts
    {
      A: key.a_key + offset.a_offset,
      B: key.b_key + offset.b_offset,
      C: key.c_key + offset.c_offset,
      D: key.d_key + offset.d_offset
    }
  end


end