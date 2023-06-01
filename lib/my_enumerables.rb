module Enumerable
  def my_each_with_index
    for i in 0..self.length-1 do
      yield self[i], i
    end
    self
  end

  def my_select
    array=[]
    for element in self do
      if yield element then array << element end
    end
    array
  end

  def my_all?
    for element in self do
      unless yield element then return false end
    end
    true
  end

  def my_any?
    for element in self do
      if yield element then return true end
    end
    false
  end

  def my_none?
    for element in self do
      if yield element then return false end
    end
    true
  end

  def my_count
    return self.size unless block_given?
    count = 0
    for element in self do
      if yield element then count+=1 end
    end
    count
  end

  def my_map
    enum = []
    for element in self do
      enum << (yield element)
    end
    enum
  end

  def my_inject (value)
    for element in self do
      value = (yield value,element)
    end
    value
  end
  
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here

  def my_each
    for element in self do
      yield element
    end
    self
  end
end
