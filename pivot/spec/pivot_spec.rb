require "rspec"
require "pry"
# require "plymouth"
require_relative '../pivot.rb'

describe Pivot, "#index" do

  it "returns -1 with no pivots" do
    array = [4] * 4
    pivot = Pivot.new(array)
    # binding.pry
    expect(pivot.index).to eq(-1) 
  end

  it "returns -1 on a blank array" do
    pivot = Pivot.new([]) 
    expect(pivot.index).to eq(-1) 
  end
  
  it "returns left-most pivot" do
    pivot = Pivot.new([20, 0, 0, 0, 20])
    # binding.pry
    expect(pivot.index).to eq(1)
  end

  it "returns 2" do
    pivot = Pivot.new([1, 4, 6, 3, 2])
    expect(pivot.index).to eq(2)
  end

  it "has an index at 70" do
    array = [0]*100
    2.times { |n| array.insert(80+n, 30) }
    array.insert(50, 60)

    pivot = Pivot.new(array)
    # binding.pry
    expect(pivot.index).to eq(51) 
  end

  it "returns -1" do
    pivot = Pivot.new([20, 0, 0, 0])
    expect(pivot.index).to eq(-1)
  end
  
end
