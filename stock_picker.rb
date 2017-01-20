def stock_picker(stock_price_list)
	profit_perspective_list = []
	stock_price_list.each_with_index do |current_price, current_index|
			stock_price_list[0..current_index].each_with_index do |past_price, past_index|
				profit = current_price - past_price
				profit_perspective_list << 
				{:profit => profit,
				:past_index => past_index,
				:current_index => current_index}
		end
	end
	best_profit = profit_perspective_list.max_by{|x| x[:profit]}
	return best_profit[:past_index], best_profit[:current_index]
end

puts stock_picker([17,3,6,9,15,8,6,1,10])
puts stock_picker([1,2,3,4,1,6,7,8,9,10,9,8,7,4,5,16,7,8,19])
puts stock_picker([17,3,6,9,15,8,6,10,1,16])
puts stock_picker([1,2,3,4,5,6,7,8,9,10,11,12,13])
puts stock_picker([10,9,8,7,6,5,4,3,2,1])