class Game
  def initialize(dic_file)
    @dic_file = dic_file


  def self.display_hangman(tries)
    l_arm = ' '
    case tries
    when 5
      head = '0'
    when 4
      head = '0'
      body = "|"
    when 3
      head = '0'
      body = "|"
      l_arm = "/"
    when 2
      head = '0'
      body = "|"
      l_arm = "/"
      r_arm = "\\"
    when 1
      head = '0'
      body = "|"
      l_arm = l_leg = "/"
      r_arm = "\\"
    when 0
      head = '0'
      body = "|"
      l_arm = l_leg = "/"
      r_arm = r_leg = '\\'
    end
    puts %{
    ___________
    |         |
    |         #{head}
    |        #{l_arm}#{body}#{r_arm}
    |        #{l_leg} #{r_leg}
    |
    |
    }
  end

  def pick_random_line
    words = @dic_file.readlines
    line_index = rand(0..words.size)
    
    return words[line_index].chomp.split("\t")
  end

  def 

end

class Player
  def initialize(name)
    @name = set_name
    @current_word = ""
    @current_tries = 6
    @past_words = []
  end

  def set_name
    puts "Please type your name:"
    player_name = gets
    puts
    player_name
  end

end