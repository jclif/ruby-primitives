# require "debugger"; debugger

class Employee
  attr_accessor :name, :title, :salary, :bonus
  attr_reader :boss

  def initialize(name, title, salary, boss = nil)
    @name, @title, @salary, @boss = name, title, salary, boss
    boss.underlings << self if boss
  end

  def boss=(manager)
    @boss = manager
    manager.underlings << self
  end

  def bonus(multiplier)
    salary * multiplier
  end
end

class Manager < Employee
  attr_accessor :underlings

  def initialize(name, title, salary, boss = nil)
    @underlings = []
    super(name, title, salary, boss)
  end

  def bonus(multiplier)
    sum = 0
    underlings_array = underlings.dup

    until underlings_array.empty?
      current = underlings_array.shift
      underlings_array += current.underlings if current.is_a?(Manager)
      sum += current.salary
    end

    sum
  end
end

if __FILE__ == $0
  p = Manager.new("Bob", "President", 1_000_000)
  m = Manager.new("Joe", "Manager", 1_000, p)
  e1 = Employee.new("Johnny", "Sanitation Engineer", 50, m)
  e2 = Employee.new("Susan", "Sanitation Engineer", 25, m)

  # e1.boss = m
  # e2.boss = m
  # m.boss = p

  p p.bonus(2)
  p m.bonus(5)
  p e1.bonus(7)

  p p.underlings
  p m.underlings
end