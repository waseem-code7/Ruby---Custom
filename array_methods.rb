# Monkey Patching

class Array
  
  def custom_include?(value)
    n = self.length
    for i in 0...n do
      if self[i] === value
        return true
      end
    end
    return false
  end

  def copy
    Marshal.load(Marshal.dump(self))
  end

  def custom_at(index)
    if index >= self.length or index < -(self.length)
      return -1
    end

    if index > -1
      return self[index]
    end

    return self[self.length + index]
  end

  def custom_flatten(depth = nil)
    ans = []
    return self if depth === 0

    for i in 0...self.length do
      if self[i].class == Array
        temp = self[i].custom_flatten(depth.nil? ? nil : depth - 1)
        ans.concat(temp)
      else
        ans << self[i]
      end
    end
    return ans
  end

  def custom_flatten!(depth = nil)
    return self if depth === 0
    curr = []
    self.each do |element|
      if element.is_a?(Array)
        temp = element.custom_flatten!(depth.nil? ? nil : depth - 1)
        curr.concat(temp)
      else
        curr.push(element)
      end
    end
    self.replace(curr)
  end

  def custom_reverse
    curr = []
    i = self.length - 1

    while i >= 0 do
      curr << self[i]
      i -= 1
    end
    return curr
  end

  def custom_reverse!
    i = 0
    j = self.length - 1

    while i <= j do
      temp = self[i]
      self[i] = self[j]
      self[j] = temp
      i += 1
      j -= 1
    end
  end

  def bsearch_excat
    i = 0
    j = self.length - 1

    while i <= j do
      mid = (i + j) / 2
      x = yield(self[mid])
      
      return 0 if x === 0

      if x < 0
        i = mid + 1
      else
        j = mid - 1
      end
    end
  end

  def bsearch_minimum
    i = 0
    j = self.length - 1
    result = nil
    while i <= j do
      mid = (i + j) / 2
      x = yield(self[mid])

      if x === true
        result = self[mid]
        j = mid - 1
      else
        i = mid + 1
      end
    end
    result
  end

  def custom_map
    curr = []
    for i in 0...self.length do
      curr.push(yield(self[i]))
    end
    curr
  end

  def custom_filter
    curr = []
    for i in 0...self.length do
      if yield(self[i])
        curr.push(self[i])
      end
    end
    curr
  end

  def custom_reduce(prev = nil)
    curr = prev.nil? ? nil : prev
    for i in 0...self.length do
      x = yield(curr, self[i])
      curr = x
    end
    curr
  end
  
end

arr = (1..10).to_a

# arr2 = [[1,3,4], [5,6,7], [[7,8], 8, 9]]
# puts arr.custom_at(1)

# p arr2.custom_flatten!
# p arr2

# arr.reverse!
# curr = arr.reverse
# p curr
# p arr
arr2 = [10, 21, 33, 40, 50, 60]
# x = arr2.bsearch_excat {|x| x <=> 60}

# y = arr2.bsearch_minimum {|x| x >= 45}

x = arr2.custom_map do |number|
  number * 2
end

y = arr2.custom_filter do |number|
  number.odd?
end

sum = arr.custom_reduce(0) {|prev, curr| prev + curr}

puts sum
