require "./game.rb"

path = "words_utf8.txt"

game = Game.new(path)
player = Player.new

game.play(player)