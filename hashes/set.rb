def set_add_el(hash, el)
  hash[el] = true unless hash[el]
  hash
end

def set_remove_el(hash, el)
  hash.delete(el) if hash[el]
  hash
end

def set_list_els(hash)
  hash.keys
end

def set_member?(hash,el)
  hash.include?(el)
end

def set_union(h1,h2)
  h1.merge(h2)
end

def set_intersection(h1,h2)
  h0 = {}
  h1.merge(h2).each do |key,value|
    if h1.include?(key) and h2.include?(key)
      h0[key] = value
    end
  end
  h0
end

def set_minus(h1,h2)
  h0 = {}
  h1.each do |key,value|
    if not h2.include?(key)
      h0[key] = value
    end
  end
  h0
end

p set_add_el({}, :x) # => make this return {:x => true}
p set_add_el({:x => true}, :x) # => {:x => true} # This should automatically work if the first method worked
p set_remove_el({:x => true}, :x) # => {}
p set_list_els({:x => true, :y => true}) # => [:x, :y]
p set_member?({:x => true}, :x) # => true
p set_union({:x => true}, {:y => true}) # => {:x => true, :y => true}
p set_intersection({:x => true},{:x => true,:y => true})# I'm not going to tell you how the last two work
p set_minus({:x => true,:y => true},{:x => true})