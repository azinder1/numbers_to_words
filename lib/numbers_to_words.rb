class Fixnum
  define_method(:numbers_to_words) do

    ones_position = {1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine"}

    teens_position = {10 => "ten", 11 =>"eleven", 12 => "twelve", 13 => "thirteen", 14 => "forteen", 15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 18 => "eighteen", 19 => "nineteen"}

    tens_position = {2 => "twenty", 3 => "thirty", 4 => "fourty", 5 => "fifty", 6 => "sixty", 7 => "seventy", 8 => "eighty", 9 => "ninety"}

    value_placeholder = { 0 => "hundred", 1 => "thousand", 2 => "million", 3 => "billion", 4 => "trillion"}

    get_hundreds  = Proc.new { |number_array|
      word_array = []
      teen_value = number_array[0..1].join('').reverse().to_i
      number_array.each().with_index() do |value, i|
        if value == 0
        elsif i == 2
          word_array.unshift(value_placeholder.fetch(0))
          word_array.unshift(ones_position.fetch(value))
        elsif i ==  0
          word_array.unshift(ones_position.fetch(value))
        elsif i ==  1 and value == 1
          teen =
          word_array.pop()
          word_array.unshift(teens_position.fetch(teen_value))
        elsif i ==  1
          word_array.unshift(tens_position.fetch(value))
        end
      end
      word_array.join(" ")
    }

    final_array = []
    block_array = []

    number_array = self.to_s.split("").map(&:to_i).reverse()

    while (number_array.length/3.0).ceil() > 0 do
       block_array.push(number_array.slice!(0..2))
    end

    block_array.each().with_index() do |placeholder, i|
        if i == 0
          if placeholder.at(0) == 0  and placeholder.at(1) == 0  and  placeholder.at(2) == 0
          else
          final_array.push(get_hundreds.call(placeholder))
        end
        elsif i >= 1
          if placeholder.at(0) == 0  and placeholder.at(1) == 0  and  placeholder.at(2) == 0
          else
            final_array.unshift(value_placeholder.fetch(i))
            final_array.unshift(get_hundreds.call(placeholder))
          end
        end
    end
    final_array.join(" ")
  end
end
