def is_letter?(char)
  char.match? /\A[a-zA-Z]*\z/
end

def is_upper?(char)
  char == char.upcase
end

def cipher_char(char, shift_factor, 
  lower_ascii_bound, upper_ascii_bound)
  
  ascii_val = char.ord
  shift_factor = shift_factor % 26
  space = upper_ascii_bound - ascii_val 
  if shift_factor <= space
    return (ascii_val+shift_factor).chr
  else
    leftover = shift_factor - space - 1
    return (lower_ascii_bound + leftover).chr
  end
end

def caesar_cipher(string, shift_factor)
  string.each_char do |char|
    if is_letter?(char) == false
      print char
    elsif(is_upper?(char))
      # 65 = A, 90 = Z in ascii
      print cipher_char(char, shift_factor, 65, 90)
    else
      print cipher_char(char, shift_factor, 97, 122)
    end
  end

  # for inserting newline after prints. print() doesn't
  # insert newline.  
  puts ""
end

caesar_cipher("What a string!", 5)
caesar_cipher("To be or not to be, That is the question", 104)