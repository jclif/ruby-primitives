class Array

  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
  end

  def my_map
    array = []
    self.my_each { |element| array << yield(element) }
    array
  end

  def my_select
    array = []
    self.my_each do |element|
      array << element if yield(element)
    end
    array
  end

  def my_inject(init = 0)
    self.my_each do |element|
      init = yield(init, element)
    end
    init
  end

  def my_sort!
    (self.length-1).times do
      i = 0
      while i < self.length
        case yield(self[i],self[i+1])
          #when -1 then self[i],self[i+1] = self[i+1],self[i]
          when 1 then self[i],self[i+1] = self[i+1],self[i]
        end
        i += 1
      end
    end
    self
  end
end

def do_stuff(*stuff)
  block_given? ? yield(*stuff) : puts("NO BLOCK GIVEN!")
end