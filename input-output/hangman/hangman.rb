require "./game.rb"

path = "words_utf8.txt"

player = Player.set_player
game = Game.new(path, player)

game.call_menu