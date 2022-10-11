class Hangman
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses #defines a "gets" method for the preceding attributes
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word #needs to be Hangman.random_word
    @guess_word = Array.new(@secret_word.length,"_") #hype, nice work
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
     @attempted_chars.include?(char) ? true: false #trying to get used to one-line ternaries. Not sure if this is actually easier or harder to read
  end

  def get_matching_indices(guessedChar) #gets the index of the matching characters in the word
    indexArr = []
    @secret_word.each_char.with_index do |char, index|
      indexArr << index if char == guessedChar
    end
    return indexArr #returns an empty arr if it never got filled
  end

  def fill_indices(guessedChar, arr) #based on the spec, it's assuming that the passed-in arr has already gone through get_matching_indices
    arr.each do |index| #each ele is an index in this array
      @guess_word[index] = guessedChar
    end
  end

  #part_2
  def try_guess(char)
    if get_matching_indices(char) != [] #if it didn't return an empty array, then it was a successful guess
      fill_indices(char, get_matching_indices(char))
    else
      @remaining_incorrect_guesses -= 1
    end
    if already_attempted?(char)
      puts "that has already been attempted"
      return false
    else
      @attempted_chars << char
      return true
    end
  end

  def ask_user_for_guess
    puts "Enter a char:"
    input = gets.chomp
    try_guess(input) #returns the output of try_guess
  end

  def win?
    if @guess_word.join("") == @secret_word #.join because it needs to compare a string to a string
      puts "WIN"
      return true
    end
    return false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    end
    return false
  end

  def game_over?
    if win? || lose?
      puts @secret_word
      return true
    else
      return false
    end
  end






end





# DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
# random_word = DICTIONARY.sample(1) #this returns an array
# p random_word
# random_word2 = DICTIONARY.sample #this returns a string
# p random_word2
