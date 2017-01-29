require "./game.rb"

dictionary = open("words_utf8.txt", "r")

def pick_random_line(file)
  
  words = file.readlines
  line_index = rand(0..words.size)
  final_line = []


  return words[line_index].chomp.split("\t")
end

p pick_random_line(dictionary)
