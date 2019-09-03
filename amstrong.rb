class Armstrong
  def is_Armstrong(number)
    new_Number = 0;
    digit_Array = number.chars
    number = number.to_i
    digits = Math.log10(number).to_i + 1
    for i in (0..digits) do
     new_Number += digit_Array[i].to_i ** digits
    end
    return true if new_Number == number
  end
   def find_Armstrong(lower,upper)
    armstrong_List = []
    for i in (lower..upper)
      armstrong_List << i if is_Armstrong(i.to_s)
    end
    armstrong_List.each do |element|
      print "#{element}\t"
    end
    puts ""
  end
end
armstrong = Armstrong.new
if ARGV.length == 1
  if armstrong.is_Armstrong(ARGV[0])
    puts "Armstrong"
  else
    puts "Not Armstrong"
  end
 elsif ARGV.length == 2
     armstrong.find_Armstrong(ARGV[0],ARGV[1])
else
  print "Enter a number : "
  number = gets.chomp
  if armstrong.is_Armstrong(number)
    puts "Armstrong"
  else
    puts "Not Armstrong"
  end
end
