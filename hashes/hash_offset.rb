def correct_hash(hash, num)
  alphabet = (:a..:z).to_a
  correct_hash = {}
  hash.each_key do |key|
    if alphabet.index(key) + num > 26
      correct_hash[alphabet[alphabet.index(key) + num - 26]] = hash[key]
    else
      correct_hash[alphabet[alphabet.index(key) + num]] = hash[key]
    end
  end
  correct_hash
end