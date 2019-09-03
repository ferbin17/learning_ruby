class Email
  def initialize(sender, mail)
    @sender = sender
    @mail = mail
  end
end

require 'io/console'

pattern = /^([\.]*[\w]{1,32}[\.]*)+\@[\w]{1,32}\.[\w]{2,20}([\.]\w{2,20})?$/

print "Enter a recipient mail id: "
recipient = gets.chomp
loop do
  break if recipient.match(pattern)
  print "Enter a valid mail id: "
  recipient = gets.chomp
end

print "Enter the subject: "
subject = gets.chomp

print "Enter the body: "
body = gets.chomp

print "Enter your mail id: "
sender = gets.chomp
loop do
  break if sender.match(pattern)
  print "Enter a valid mail id: "
  sender = gets.chomp
end
print "Enter your password"
password = STDIN.noecho(&:gets).chomp

mail = {}
mail[:recipient] = recipient
mail[:subject] = subject
mail[:body] = body

sender_hash = {}
sender_hash[:mail] = sender
sender_hash[:password] = password

email = Email.new(sender_hash, mail)

file = File.new("data.txt","w+")
file.write("#{email.inspect}")
file.close
system('node sent.js')
