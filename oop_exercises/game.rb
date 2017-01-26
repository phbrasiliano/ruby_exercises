require './board.rb'

class Game
  def initialize
    @board = Board.new

    puts "Welcome to the tic-tac-toe game, by Phellipe"
    @players =  new_players
    @turn = 0
  end

  def new_players
    puts "Please enter your name, player 1"
    player1 = {char: 'X'}
    player1[:name] = gets.chomp

    puts "\nNow, please enter your name, player 2"
    player2 = {char: 'O'}
    player2[:name] = gets.chomp

    return [player1, player2]
  end

  def take_turn(player)
    loop do  
      puts "#{player[:name]} please input where you want to place your piece."
      puts "Use the column and the row characteres (e.g. 'A1')"
      @board.display
      input = gets.strip.downcase.delete(' ').match(/[a-c]{1}[1-3]{1}/).to_s
      # this line gets the user input and makes sure it matches the board
      unless input && @board.change_tile(input, player[:char])
        puts 'That was not a valid position'
        redo
      end
      break
    end
  end


  def play_loop
    local_turn = @turn
    player1 = @players[0]
    player2 = @players[1]

    until @board.check_victory
      take_turn(@players[local_turn])
      local_turn = local_turn == 0 ? 1 : 0
    end
    end_match = @board.check_victory
    @board.display
    if end_match == 'draw'
      puts "That was a draw, starting again..."
    elsif end_match == 'X'
      puts player1[:name] + " wins!\nStarting again..."
    else
      puts player2[:name] + " wins!\nStarting again..."
    end
    @turn = @turn == 0 ? 1 : 0
    @board.clear
  end
end




#tests here

game = Game.new
while true
  game.play_loop
end