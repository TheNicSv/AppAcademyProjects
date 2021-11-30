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

  def my_transpose
    n = self.length
    array = Array.new(n){Array.new}
    self.each_with_index do |sub, i1|
      sub.each_with_index do |ele, i2|
        array[i2][i1] = ele
      end
    end
    array
  end
end
