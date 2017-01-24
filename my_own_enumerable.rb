module Enumerable
	def my_each
		for item in self
			yield item
		end
	end

	def my_each_with_index
		idx = 0
		for item in self
			yield(idx, item)
			idx += 1
		end
	end

	def my_select
		new_array = []
		self.my_each do |item|
			clause = yield(item)
			new_array << item if clause
		end
		new_array
	end

	def my_all?
		self.my_each do |item|
			return false unless yield item 
		end
		return true
	end

	def my_any?
		self.my_each do |item|
			return true if yield item
		end
		return false
	end

	def my_none?
		self.my_each do |item|
			return false if yield item
		end
		return true
	end

	def my_count(param=nil)
		counter = 0
		if param
			self.my_each do |item|
				counter += 1 if item == param				
			end
		elsif block_given?
			self.my_each do |item|
				counter +=1 if yield item
			end
		else
			counter = self.size
		end
		counter
	end

	
			

end