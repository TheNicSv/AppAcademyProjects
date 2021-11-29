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
