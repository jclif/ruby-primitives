def rps(users_choice)
  choices = %w{Rock Paper Scissors}
  computers_choice = choices.sample
  result = {
    'Rock' => {'Rock' => 'Draw', 'Paper' => 'Lose', 'Scissors' => 'Win'},
    'Paper' => {'Rock' => 'Win', 'Paper' => 'Draw', 'Scissors' => 'Lose'},
    'Scissors' => {'Rock' => 'Lose', 'Paper' => 'Win', 'Scissors' => 'Draw'}
  }
  "#{computers_choice}, #{result[users_choice][computers_choice]}"
end

# p rps("Rock") # => "Paper, Lose"
# p rps("Scissors") # => "Scissors, Draw"
# p rps("Scissors") # => "Paper, Win"