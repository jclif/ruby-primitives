require 'debugger'

class RPNCalculator
  def initialize
    @stack = []
  end
  def value
    @stack[-1]
  end
  def push(x)
    # puts "pushing: " + x.to_s
    @stack << x
  end
  def check_stack
    if @stack == []
      raise Exception, "calculator is empty"
    elsif @stack.length == 1
      raise Exception, "only one operand"
    end
  end
  def plus
    check_stack
    @stack << @stack.pop + @stack.pop
  end
  def minus
    check_stack
    @stack << -(@stack.pop - @stack.pop)
  end
  def divide
    check_stack
    @stack << 1 / (@stack.pop.to_f / @stack.pop.to_f)
  end
  def times
    check_stack
    @stack << @stack.pop * @stack.pop
  end
  def tokens(str)
    str.split(" ").map! {|x|
      if !!(x =~ /^[-+]?[0-9]+$/)
        Integer(x)
      else
        x.to_sym
      end
    }
  end
  def evaluate(str)
    stack = tokens(str)
    stack.each_with_index {|x,i|
      if x.class == Fixnum
        push(x)
      elsif x == :+
        plus
      elsif x == :-
        minus
      elsif x == :/
        divide
      else
        times
      end
    }
    value
  end

  def self.run
    calculator = RPNCalculator.new
    input = nil
    until input == 'q'
      input = calculator.user_input
      calculator.evaluate(input)
    end
  end

  def user_input
    print "#{@stack}: "
    gets.chomp
  end

  def get_file_name
  end
end

if __FILE__ == $PROGRAM_NAME
  if ARGV[0] == '--eval'
    puts RPNCalculator.new.evaluate(ARGV[1])
  elsif ARGV[0] == '--file'
    evaluation_string = File.readlines(ARGV[1]) {|line| line.chomp}[0]
    puts RPNCalculator.new.evaluate(evaluation_string)
  end
  # RPNCalculator.run
end

# calculator = RPNCalculator.new
# p calculator.evaluate('1 1 +')
# p calculator.evaluate('1 2 3 4 5 + + + +')