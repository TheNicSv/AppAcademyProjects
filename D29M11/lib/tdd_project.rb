class Array
  def my_uniq
    arr = []
    self.each do |ele|
      arr << ele unless arr.include?(ele)
    end
    arr
  end

  def two_sum
    arr = []
    (0...self.length).each do |i1|
      (i1+1...self.length).each do |i2|
        if (self[i1] + self[i2]) == 0
          arr << [i1,i2]
        end
      end
    end
    arr
  end
end
