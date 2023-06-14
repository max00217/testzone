def is_munchausen_number(num)
  digits = num.to_s.chars.map(&:to_i)
  powered_sum = digits.sum { |digit| digit**digit }
  powered_sum == num
end

(1..200000).each do |num|
  puts num if is_munchausen_number(num)
end
