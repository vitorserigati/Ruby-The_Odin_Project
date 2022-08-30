def stock_picker(array)
  min_price = array[0]
  min_index = 0

  profit = 0
  days = [0, 0]

  array.each_with_index do |prices, index|
    if prices < min_price
      min_price = prices
      min_index = index
      next
    end
    if prices - min_price > profit
      profit = prices - min_price
      days = [min_index, index]
    end
  end

  days
end

puts stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10]).to_s
