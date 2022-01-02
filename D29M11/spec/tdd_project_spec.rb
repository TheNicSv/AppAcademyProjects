require "tdd_project.rb"
describe "#my_uniq" do
  arr = [1,2,8,1,4,2]
  it "should take an array and return a new array" do
    expect(arr.my_uniq).to_not be (arr)
  end

  it "should return an array with all the duped elements deleted and in the correct order" do
    expect(arr.my_uniq).to eq ([1,2,8,4])
  end
end

describe "Array#two_sum" do
  arr = [-1, 0, 2, -2, 1]
  it "should return a 2D array" do
    expect(arr.two_sum[0]).to be_a(Array)
  end
  it "should return the indeces in which the sum is 0" do
    expect(arr.two_sum).to eq([[0, 4], [2, 3]])
  end
end

describe "Array#my_transpose" do
  arr = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]
  it "should return an array" do
    expect(arr.my_transpose).to be_a(Array)
  end
  it "should be shift columns to rows" do
    expect(arr.my_transpose[0]).to eq([0,3,6])
  end
  it "should transpose all of the columns" do
    expect(arr.my_transpose).to eq([[0,3,6],[1,4,7],[2,5,8]])
  end
end

describe "#stock_picker" do
  array = [25,48,71,35,12,88,15,48,1,22,15,42,25,15]
  it "should return a array" do
    expect(stock_picker(array)).to be_a(Array)
  end
  it "should contain 2 elements" do
    expect(stock_picker(array).count).to eq(2)
  end
  it "should have the first element appear earlier in the original array" do
    expect(stock_picker(array)[0]).to eq(4)
  end
  it "should return the best days to buy and sell" do
    expect(stock_picker(array)).to eq([4,5])
  end
end

describe "Towers" do
  subject(:towers) {Towers.new}
  it "should initializa 3 array" do
    expect(towers.rods).to be_a(Array)
    expect(towers.rods.length).to eq(3)
  end
  it "should have the first array be the tower in ascending order" do
    expect(towers.rods.first).to eq([4,3,2,1])
  end

  describe "move" do
    it "should take in two values" do
      expect(towers.move(0,2))
    end

    it "should only accept values between 0 and 2" do
      expect(towers.move(5,0)).to raise_error(ArgumentError)
    end

    it "has to have different values" do
      expect(towers.move(0,0)).to raise_error(ArgumentError)
    end
  end
end
