require 'byebug'
class MaxIntSet
  attr_accessor :store

  def initialize(max)
    @store = Array.new(max)
  end

  def insert(num)
    if num < 0 || num > store.length
      raise "Out of bounds"
    else 
      store[num] = true
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    if store[num] == true
      return true
    else
      false
    end
  end
  
  # private
  # def is_valid?(num)

  # end

  # def validate!(num)
  # end
end


class IntSet

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    location = num % num_buckets
    @store[location] << num
  end

  def remove(num)
    location = num % num_buckets
    if @store[location].include?(num)
        idx = @store[location].index(num)
        @store[location].delete_at(idx)
    end
  end

  def include?(num)
    location = num % num_buckets
    if @store[location].include?(num)
      return true
    else
      false
    end
  end

  private

  # def [](num)
  #   # optional but useful; return the bucket corresponding to `num`
  # end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
     return false if include?(num)
    self[num] << num
    self.count += 1
    resize! if num_buckets < self.count

    num
  end

  def remove(num)
   self.count -= 1 if self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    self.store[num % num_buckets]
  end

  def num_buckets
    self.store.length
  end

  def resize!
    prev_buckets = self.store
    self.count = 0
    self.store = Array.new(num_buckets*2) { Array.new }

    prev_buckets.flatten.each { |ele| insert(ele) }
  end
  

end
