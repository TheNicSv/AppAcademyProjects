class Array
  def my_uniq
    arr = []
    self.each do |ele|
      arr << ele unless arr.include?(ele)
    end
    arr
  end

end
