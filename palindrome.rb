class Palindrome
  def is_Palindrome(string)
    return true if string == string.reverse
  end
end
string = "malayalam"
if Palindrome.new.is_Palindrome(string)
  puts "Palindrome"
else
  puts "Not Palindrome"
end
