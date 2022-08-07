module Splitable

  def message_split
    message.chars
  end

  def chars_split
    message_split.each_slice(4).to_a
  end

end