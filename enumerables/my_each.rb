class Array
  def my_each(&block)
    for i in (0...self.length)
      block.call(self[i])
    end
  end
end