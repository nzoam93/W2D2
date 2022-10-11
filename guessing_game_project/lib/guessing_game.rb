class GuessingGame
    # attr_reader :num_attempts, :game_over
    def initialize(min, max)
        @min = min #all the variables inside of the initialize method must be preceded by the @ sign
        @max = max
        @secret_num = rand(@min..@max)
        @num_attempts = 0
        @game_over = false
    end

    def num_attempts
        @num_attempts
    end

    def game_over?
        @game_over
    end

    def check_num(num)
        @num_attempts += 1
        if num < @secret_num
            puts "too small"
        elsif num == @secret_num
            @game_over = true
            puts "you win"
        else
            puts "too big"
        end
    end

    def ask_user
        puts "enter a number"
        number = gets.chomp.to_i #makes it a number without the \n at the end
        check_num(number) #I don't need to specify GuessingGame.check_num. I just call the method check_num itself!
    end



end
