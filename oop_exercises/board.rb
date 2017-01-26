class Board
  WINNING_COMBINATIONS = [
  ['a1','a2','a3'], ['b1','b2','b3'], ['c1','c2','c3'],
  ['a1','b1','c1'], ['a2','b2','c2'], ['a3','b3','c3'],
  ['a1','b2','c3'], ['c1','b2','a3']]

  def initialize
    clear_board
  end

  def display
    b = @board_tiles
    puts "\t  A B C"
    puts "\t1 #{b['a1']}|#{b['b1']}|#{b['c1']}"
    puts "\t2 #{b['a2']}|#{b['b2']}|#{b['c2']}"
    puts "\t3 #{b['a3']}|#{b['b3']}|#{b['c3']}"
    puts "MEU PAAU" if check_victory('X')
  end

  def change_tile(tile_espace, char)
    @board_tiles[tile_espace] = char
  end

  private

  def check_victory(char)
    b = @board_tiles
    WINNING_COMBINATIONS.each do |combination|
      if combination.select{ |k, v| b[k] == char}.count == 3
        return true
      else
        return false
      end
    end
  end

  def clear_board
    @board_tiles = Hash.new('-')
  end

end




#tests here

board = Board.new
board.display
sleep 1
board.change_tile('a1', 'X')
board.display
sleep 1

board.change_tile('a2', 'X')
board.display
sleep 1

board.change_tile('a3', 'X')
board.display