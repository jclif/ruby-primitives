class NumberThingy

  def initialize
    @number = Random.rand(1..100)
    @guesses = 0
    @guess = -1
  end

  def run
    puts "Let's play a game."
    until @guess == @number
      @guess = get_user_input
      respond_to_user
      @guesses += 1
    end
  end

  def get_user_input
    print "Guess a number between 1 and 100: "
    @guess = gets.chomp.to_i
  end

  def respond_to_user
    if @guess < @number
      puts "Too Low!!!"
    elsif @guess > @number
      puts "Too High!!!"
    else @guess == @number
      puts "Lucky guess..."
    end
  end
end

NumberThingy.new.run
