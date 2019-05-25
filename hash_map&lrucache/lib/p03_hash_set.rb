require_relative "p02_hashing.rb"

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
  end

  def include?(key)
    arr = @store.flatten
    arr.include?(self[key])
  end

  def remove(key)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    new_num = 0
    case num
    when num.is_a?(Hash)
      new_num = Hash.hash(num)
    when num.is_a?(String)
      new_num = String.hash(num)
    when num.is_a?(Array)
      new_num = Array.hash(num)
    when num.is_a?(Integer)
      new_num = Integer.hash
    end

    self.store[new_num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
