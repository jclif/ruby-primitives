class Array
  def my_uniq
    array = []
    self.each do |x|
      unless array.include?(x)
        array << x
      end
    end
    array
  end
end