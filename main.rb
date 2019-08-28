class Word
  attr_accessor :displaying_word  
  def initialize(word)
    @word = word
    @array_of_letters = @word.split("")
    @displaying_word = "_" * word.length

  end

    # Guess a letter in the word.
  # Should return a boolean. true if the letter is in the word, false if not.
  def guess?(letter)
    if (@word.include?(letter))
      arr_of_indicies = []
      arr_of_indicies = @array_of_letters.each_index.select do |i|
        @array_of_letters[i] == letter
      end
      arr_of_indicies.each do |index|
        @displaying_word[index] = letter
      end
      return true
    else
      return false
    end
  end

  # Whether all letters in the word have been guessed correctly.
  def guessed_all_correct?
    if @displaying_word == @word
      puts "Nailed it"
      return true
    else
      return false
    end
  end

  # Display the current state of the guessed word for the player.
  def output_word
    puts @displaying_word
  end

  # Check whether a provided character is a letter
  def self.is_letter?(character)
  end
end

class MysteryWordGame
  attr_accessor :word
  # Initialize any state in the game, and start the game loop.
  def initialize
    @guesses = 3
    @word
  end

  def ask_for_word
    puts "Enter your word"
    user_word = gets.chomp
    @word = Word.new(user_word) 
  end

  # Run the game loop, which continues until the player wins or loses.
  def game_loop
    game_over = false
    while @guesses > 0 && game_over == false do
      puts "Enter letter"
      user_letter = gets.chomp
      if @word.guess?(user_letter)
        @word.output_word
      else
        @guesses -=1
        puts "You have #{@guesses} remaining"
        if @guesses == 0
          puts "Game Over"
        end
      end
      game_over = @word.guessed_all_correct?
    end
  end
end


game = MysteryWordGame.new
game.ask_for_word
game.game_loop