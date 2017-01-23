def bubble_sort(array)
	array_counter = array.size
		while array_counter > 0
			array_counter.times do |n|
				n1 = array[n]
				n2 = array[n+1]
				array[n], array[n+1] = swap_if_bigger(n1, n2) unless n2 == nil
			end
		array_counter -=1
	end
	array		
end

def bubble_sort_by(array)
	array_counter = array.size
	while array_counter >0
		array_counter.times do |n|
			item1 = array[n]
			item2 = array[n+1]
			unless item2 == nil
				comparison = yield item1, item2 
				array[n], array[n+1] = array[n+1], array[n] if comparison > 0
			end
		end
		array_counter -=1
	end
	array
end


def swap_if_bigger(n1, n2)
	return n2, n1 if n1 > n2
	return n1, n2
end

print bubble_sort([4,3,78,2,0,2])
#expected output => [0,2,2,3,4,78]
puts
print (bubble_sort_by(["hi","hello","hey"]) do |left,right|
	left.length - right.length
end)
puts
#expected output => ["hi", "hey", "hello"]