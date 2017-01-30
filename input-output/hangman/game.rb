class Game
  def initialize(dic_path)
    @dic_path = dic_path
  end

  def display_hangman(chances)
    l_arm = ' '
    case chances
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

  # returns a array containing the word (with article when it is a noum),
  # the translation, and the times it is used.
  def pick_random_line
    words = open(@dic_path, "r").readlines
    
    puts "picking a random word for you..."
    line = [['']]

    until (6..15).include? line[0][-1].size 
      line_index = rand(0...words.size)
      line = words[line_index].downcase.chomp.split("\t")
      line[0] = line[0].split(' ')
    end
    return line
  end

  def play(player)
    line = pick_random_line
    word = line[0][-1]

    chances = player.chances
    tries = []

    puts "\n\n\n" + masked_word(word, tries)
    while chances > 0
      try = ask_for_try

      if try.size == 1
        tries << try
        if word.include? try
          puts "You got it right, letter #{try} is in your word"
        else
          puts "Sorry, but the letter #{try} is not included in your word"
          chances -= 1
        end
      else
        if word == try
          puts "Congratulations! The word is #{try}"
          break
        else
          puts "Sorry, but the word is not #{try}"
          chances -=1
        end
      end
      display_hangman(chances)
      masked_word = masked_word(word, tries)
      puts masked_word
      unless masked_word.include? "_"
        puts "Congratulations, the word was #{word}"
        break
      end
    end
    puts "Too bad, the word was #{word}" if chances == 0
  end


  def masked_word(word, tries)
    word = word.split('')
    final_word = []
    word.each do |char|
      if tries.include? char
        final_word << char
      else
        final_word << '_'
      end
    end
    final_word.join
  end


  def ask_for_try
    puts "Please guess a character, or the whole word."
    try = gets.chomp.downcase
  end


end

class Player
  attr_accessor :current_word, :chances, :past_words
  attr_reader :name

  def initialize
    @name = set_name
    @current_word = ""
    @chances = 6
    @past_words = []
  end

  private
  def set_name
    puts "Please type your name:"
    player_name = gets.chomp
    puts
    player_name
  end

end