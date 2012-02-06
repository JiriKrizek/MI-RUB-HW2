class String
  # Returns true if string contains number
  def is_number?
    true if Float(self) rescue false
  end

  # Returns true if string contains non negative number
  def is_non_negative_number?
    is_number? and Float(self)>=0
  end
end
