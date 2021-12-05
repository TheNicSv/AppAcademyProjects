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
# Stock Picker
# Write a method that takes an array of stock prices (prices on days 0, 1, ...),
# and outputs the most profitable pair of days on which to first buy the stock and then sell the stock.
# Remember, you can't sell stock before you buy it!

def stock_picker(array)
  best_days = []
  length = array.length
  bigest_profit = 0
  (0...length).each do |i1|
    (i1+1...length).each do |i2|
      profit = array[i2] - array[i1]
      if profit > bigest_profit
        best_days = [i1,i2]
        bigest_profit = profit
      end
    end
  end
  best_days
end
