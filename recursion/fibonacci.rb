# Returns the first n numers of the fibonacci sequences
def fibs(n)
  return [0] if n == 1
  return [0, 1] if n == 2
  
  current_n = 1
  f_array = [0, 1]

  (n-2).times do |n|
      f_array << current_n
      current_n = f_array[-1] + f_array[-2]
  end
  f_array 
end

# Returns the first n numbers of the fibonacci sequence.
# Made with recursion.
def fibs_rec(n, f_array = [0, 1])
  return [0] if n == 1
  return f_array if f_array.length >= n
  fibs_rec(n, f_array<<(f_array[-1] + f_array[-2]))
end

p fibs 1
p fibs 2
p fibs 4
p fibs 15


p fibs_rec 1
p fibs_rec 2
p fibs_rec 4
p fibs_rec 15
# print fibs_rec 15