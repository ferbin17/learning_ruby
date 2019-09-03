class Factroial
  def find_Factorial(number)
    factorial = 1
    (1..number).each do |number|
      factorial *= number
    end
    return factorial
  end
  def find_Fact_Rec(number)
    return 1 if number == 1 || number == 0
    factorial = number * find_Fact_Rec(number-1)
    return factorial
  end
end
fact = Factroial.new
loop do
  print "Enter a number : "
  number = gets.chomp.to_i
  puts "The Factorial of #{number} is #{fact.find_Fact_Rec(number)}"
  print "Do you wanna continue (Y/N) : "
  response = gets.chomp
  puts "\n\n\n"
break if response.downcase != "y"
end
