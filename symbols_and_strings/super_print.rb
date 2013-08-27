def super_print(original_string,options = {})
  string = original_string.dup
  defaults = {
      :times => 1,
      :upcase => false,
      :reverse => false
  }
  options = defaults.merge(options)
  # p defaults
  # p options
  if options[:upcase]
    string.upcase!
    # p string
  end
  if options[:reverse]
    string.reverse!
    # p string
  end
  string*options[:times]
end

# p super_print("Hello")                                    #=> "Hello"
# p super_print("Hello", :times => 3)                       #=> "Hello" 3x
# p super_print("Hello", :upcase => true)                   #=> "HELLO"
# p super_print("Hello", :upcase => true, :reverse => true) #=> "OLLEH"