require 'pry'
class Foo
  attr_accessor :sum, :array, :raw
  def initialize(number)
    @raw = number
    @array = []
    @sum = 0

    split_to_array
  end

  def result
    array.each_with_index do |num, idx|
      self.sum = self.sum + num.to_i if matched_pairs(num, idx)
    end
    sum
  end

  private

  def split_to_array
    raw.to_s.split('').each {|x| array << x}
  end

  def matched_pairs(num, idx)
    num == partner_for(num, idx)
  end

  def partner_for(num, idx)
    array.rotate(idx + (array.size / 2)).first
  end
end
