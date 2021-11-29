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
