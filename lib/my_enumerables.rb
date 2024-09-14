module Enumerable
  def my_each_with_index
    for i in 0...self.length() do
      yield self[i], i
    end
    return self
  end

  def my_select
    ans = []
    for i in 0...self.length() do
      if yield self[i], i then
        ans << self[i]
      end
    end
    return ans
  end

  def my_all?
    for i in 0...self.length() do
      unless yield self[i], i then
        return false
      end
    end
    return true
  end

  def my_any?
    for i in 0...self.length() do
      if yield self[i] then
        return true
      end
    end
    return false
  end

  def my_none?
    for i in 0...self.length() do
      if yield self[i] then
        return false
      end
    end
    return true
  end

  def my_count
    if !block_given?
      return self.length()
    end
    ans = 0
    for i in 0...self.length() do
      if yield self[i] then
        ans += 1
      end
    end
    return ans
  end

  def my_map
    ans = []
    for i in 0...self.length() do
      ans << yield(self[i])
    end
    return ans
  end

  def my_inject(c)
    for i in 0...self.length() do
      c = yield c, self[i]
    end
    return c
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for i in 0...self.length() do
      yield self[i]
    end
    return self
  end
end
