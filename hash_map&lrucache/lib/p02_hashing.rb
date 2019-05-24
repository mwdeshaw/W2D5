require "byebug"

class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    sum = 0
    self.each_with_index do |el,idx| 
      sum += el*idx
    end
    sum
  end
end

class String
  def hash
    alpha = ("a".."z").to_a
    sum = 0
    self.each_char.with_index do |char, idx|
        sum += (idx * alpha.index(char.downcase))
    end

    sum
  end

end

class Hash



  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    crypto = { 
    :a => 7,
    :b => 2
  }
    alpha = ("a".."z").to_a
    sum = 0

    self.each do |k,v|
      if alpha.include?(v)
        sum += crypto[k] * alpha.index(v)
      else
        sum += crypto[k] * v
      end
    end
    sum
  end
end
