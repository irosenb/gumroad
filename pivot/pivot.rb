require "pry"

class Pivot
  attr_accessor :array

  def initialize(array)
    @array = array
  end

  def index
    index = (0...@array.size).bsearch do |i|
      left = @array[0...i].inject(:+)
      right = @array[(i+1)..-1].inject(:+)
      left == right 
    end  

    index || -1 
  end

  # I was thinking about using the method below. I ended up going with the one above
  # because I felt it was not efficient enough. 

  def index_2
    left = 0
    right = @array.inject(:+)

    @array.each_with_index do |element, i|
      right -= element
      return i if left == right 
      left += element
    end

    return -1 
  end
end