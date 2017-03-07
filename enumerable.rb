module Enumerable
  def my_each
    0.upto(self.length-1) do |item|
      yield self[item] if block_given?
    end
    if block_given?
      self
    else
      self.to_enum
    end
  end

  def my_each_with_index
    0.upto(self.length-1) do |item|
      yield self[item],item if block_given?
    end
    if block_given?
      self
    else
      self.to_enum
    end
  end

  def my_select
    arr = []
    self.my_each {|item| arr << item if (yield item if block_given?)}
    if block_given?
      arr
    else
      self.to_enum
    end
  end

  def my_all?
    bool = true
    self.my_each {|item| bool = false if !(yield item if block_given?)}
    if block_given?
      bool
    else
      self.to_enum
    end
  end

  def my_any?
    bool = false
    self.my_each {|item| bool = true if (yield item if block_given?)}
    if block_given?
      bool
    else
      self.to_enum
    end
  end

  def my_none?
    bool = true
    self.my_each {|item| bool = false if (yield item if block_given?)}
    if block_given?
      bool
    else
      self.to_enum
    end
  end

  def my_count
    counter = 0
    self.my_each {|item| counter += 1 if (yield item if block_given?)}
    if block_given?
      counter
    else
      self.to_enum
    end
  end

  def my_map
    arr = []
    self.my_each {|item| arr << (yield item if block_given?)}
   if block_given?
      arr
    else
      self.to_enum
    end
  end
#Proc version of my_map
=begin
  def my_map(some_proc)
    arr = []
    self.my_each {|item| arr << some_proc.call(item)}
    arr
  end
=end

#Proc and Block version of my_map
=begin
  def my_map(some_proc = 0)
    arr = []
    self.my_each do |item|
       arr << some_proc.call(item) if some_proc.instance_of? Proc
       (arr << (yield item)) if block_given?
     end
    arr
  end
#test:
ps = Proc.new{|item| item + 1}
p [1,2,3,4,5].my_map(&ps)
=end

  def my_inject(n=0)
    self.my_each {|item| n = (yield n,item if block_given?) }
   if block_given?
      n
    else
      self.to_enum
    end
  end
=begin
*test my_inject using method below*
  def multiply_els(arr)
    arr.my_inject(1) {|a,item| a*item}
  end
p multiply_els([4,5,4])
=end

end
#
