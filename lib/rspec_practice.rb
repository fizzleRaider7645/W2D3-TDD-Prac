def my_uniq(arr)
  uniq_arr = []
  arr.each do |el|
    uniq_arr << el unless uniq_arr.include?(el)
  end
  uniq_arr
end

class Array
  def two_sum
    pairs = []
    (0...self.length - 1).each do |i|
      (i + 1...self.length ).each do |j|
        pairs << [i, j] if self[i] + self[j] == 0
      end
    end

    pairs
  end
end

def my_transpose(arr)
  return arr if arr.length == 1 && arr[0].length <= 1
  transposed = Array.new(arr.length) { [] }
  (0...arr.length).each do |i|
    (0...arr.length).each do |j|
      transposed[i] << arr[j][i]
    end
  end
  transposed
end

def stock_picker(prices)
  opt_dates = [0, 1]
  return [] if prices.empty?
  (0...prices.length - 1).each do |i|
    (i + 1...prices.length).each do |j|
      if prices[j] - prices[i] >= prices[opt_dates[1]] - prices[opt_dates[0]]
        opt_dates = [i, j]
      end
    end
  end

  opt_dates
end
