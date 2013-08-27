class Towers

  attr_accessor :a1, :a2, :a3

  def initialize(num)
    @a1 = (1..num).to_a.reverse
    @a2 = []
    @a3 = []
    @winning = @a1
    game
  end

  def towers
    [@a1,@a2,@a3]
  end

  def game
    puts "Let's play a game."
    until won?
      display
      move_disk
    end
    puts "You WIN!!!"
  end

  def won?
    if @a2 == @winning || @a3 == @winning
      return true
    else
      return false
    end
  end

  def display
    puts "Tower 1: #{@a1}"
    puts "Tower 2: #{@a2}"
    puts "Tower 3: #{@a3}"
  end

  def move_disk
    puts "Here are your legal moves: "
    legal_moves.each do |x|
      puts [x[0]+1,x[1]+1].join(" ")
    end
    puts "Where would you like to move? Ex: '1 2'"
    move = gets.split(" ").map{|x|x.to_i - 1}
    puts "move is " + move.to_s
    until legal_moves.include?(move)
      puts "Invalid move: enter new move."
      move = gets.split(" ").map{|x|x.to_i - 1}
      puts "move is " + move.inspect
    end
    make_move(move)
  end

  def legal_moves
    array = []
    (0..2).to_a.permutation(2).each do |x|
      if (towers[x[0]].last.to_i < towers[x[1]].last.to_i || towers[x[1]].last == nil) && towers[x[0]].last != nil
        array << x
      end
    end
    array
  end

  def make_move(move)
    from = towers[move[0]]
    to = towers[move[1]]
    to << from.pop
  end
end

Towers.new(3) #runs game with 3 disks