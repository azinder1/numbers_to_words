class Fixnum
  define_method(:numbers_to_words) do
    ones_position = {1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine"}

    teens_position = {10 => "ten", 11 =>"eleven", 12 => "twelve", 13 => "thirteen", 14 => "forteen", 15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 18 => "eighteen", 19 => "nineteen"}

    tens_position = {2 => "twenty", 3 => "thirty", 4 => "fourty", 5 => "fifty", 6 => "sixty", 7 => "seventy", 8 => "eighty", 9 => "ninety"}

    value_placeholder = { 3 => "hundred", 4 => "thousand", 7 => "million", 10 => "billion", 13 => "trillion"}

    number_array=self.to_s.split("").map(&:to_i).reverse()
    word_array = []
    number_array.each().with_index() do |value, i|
      if value == 0
      elsif i == 2
        word_array.unshift(value_placeholder.fetch(i+1))
        word_array.unshift(ones_position.fetch(value))
      elsif i ==  0
        word_array.unshift(ones_position.fetch(value))
      elsif i ==  1 and value == 1
        word_array.pop()
        word_array.unshift(teens_position.fetch(self))
      elsif i ==  1
        word_array.unshift(tens_position.fetch(value))
      end
    end
    word_array.join(" ")
  end
end
