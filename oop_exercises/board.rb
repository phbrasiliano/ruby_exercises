class Board
  WINNING_COMBINATIONS = [
  ['a1','a2','a3'], ['b1','b2','b3'], ['c1','c2','c3'],
  ['a1','b1','c1'], ['a2','b2','c2'], ['a3','b3','c3'],
  ['a1','b2','c3'], ['c1','b2','a3']]

  def initialize
    clear
  end

  def clear
    @board_tiles = Hash.new('-')
  end

  def display
    b = @board_tiles
    puts "\n\t  A B C"
    puts "\t1 #{b['a1']}|#{b['b1']}|#{b['c1']}"
    puts "\t2 #{b['a2']}|#{b['b2']}|#{b['c2']}"
    puts "\t3 #{b['a3']}|#{b['b3']}|#{b['c3']}\n"
  end

  def change_tile(tile_espace, char)
    if tile_espace == ''
      return false
    elsif @board_tiles[tile_espace] == '-'
      @board_tiles[tile_espace] = char
    else
      return false
    end
  end

  def check_victory
    return 'X' if three_match?('X')
    return 'O' if three_match?('O')
    return 'draw' if @board_tiles.none? { |k, v| v == '-' } && @board_tiles.size == 9
    nil
  end

  private

  def three_match?(char)
    b = @board_tiles
    WINNING_COMBINATIONS.each do |combination|
      if combination.select{ |k, v| b[k] == char}.count == 3
        return true
      end
    end
    false
  end
end

