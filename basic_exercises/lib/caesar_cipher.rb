def caesar_cipher(text, shift)
  lower_alpha = ('a'..'z').to_a
  upper_alpha = ('A'..'Z').to_a
  coded_string = ''
  for char in text.split('')
    if lower_alpha.include?(char)
      coded_string << lower_alpha[shift_calc(lower_alpha.index(char), shift)]
    elsif upper_alpha.include?(char)
      coded_string << upper_alpha[shift_calc(upper_alpha.index(char), shift)]
    else
      coded_string << char
    end
  end
  coded_string
end

def shift_calc(char_val, shift)
  current_value = char_val + shift
  until (0..25).to_a.include?(current_value)
    if current_value < 0
      current_value += 26
    else
      current_value -= 26
    end
  end
  current_value
end
