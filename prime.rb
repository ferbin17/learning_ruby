class Prime
  def is_Prime(number)
    (2..Integer.sqrt(number)).each do |num|
      return false if number % num == 0
    end
  end
  def display(boolean)
    if boolean
      puts "Prime"
    else
      puts "Not Prime"
    end
  end
  def list_Primes(lower,upper)
    prime_List = []
    flag = true
    if lower == 1
      number = lower + 1
    else
      number = lower
    end
    while number <= upper
      flag = true
      (2..(Integer.sqrt(number))).each do |num|
         if number % num == 0
           flag = false
           break
         
         end
      end
      prime_List << number if flag
      number += 1
    end
    prime_List.each { |elements|  print "#{elements}\t"}
    puts ""
  end
end

loop do
  print "Choose a option\n1.Check whether a number is prime or not\n2.Find prime numbers in a range\nChoose any other key to exit : "
  response = gets.chomp
  case response
    when "1"
      print "Enter a number : "
      number = gets.chomp.to_i
      prime = Prime.new
      prime.display(prime.is_Prime(number))
    when "2"
      print "Enter the lower bound : "
      lower = gets.chomp.to_i
      print "Enter the upper bound : "
      upper = gets.chomp.to_i
      Prime.new.list_Primes(lower,upper)
    else
      return
  end
  print "Do you wanna continue (Y/N) : "
  response = gets.chomp
  puts "\n\n\n"
break if response.downcase != "y"
end
