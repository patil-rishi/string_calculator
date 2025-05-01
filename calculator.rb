class Calculator
    def add(numbers)
        return 0 if numbers.strip.empty?
        if numbers.start_with?("//")
            delimiter = numbers[2]
            numbers = numbers[4..-1].gsub(delimiter, ",")
        else
            delimiter = ","
            numbers = numbers.gsub("\n", ",")
        end
        numbers = numbers.split(",").map(&:to_i)
        negative_numbers = numbers.select { |num| num.to_i < 0 }
        if negative_numbers.any?
            raise "negative numbers not allowed #{negative_numbers.join(',')}"
        end
        numbers.sum
    end
end