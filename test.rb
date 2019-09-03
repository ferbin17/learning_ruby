# class Person
#   def initialize(name)
#     @name = name
#   end
#   def name
#
#   end
#   def password=(password)
#     @password = password
#   end
  # def greet(other)
  #   puts "Hi " + other
  #   puts "I am "
  # end
# end

# num = gets.chomp.to_i
# person = Person.new("Moopan")
# friend = Person.new("Chottu")
# person.password=("my password")

# num.times do
#   person.greet(friend)

# num = [1, 2, 3, 4, 5]
# num.each do |number|
#   puts "#{number} was passed to the block"
# end

# p num.collect { |number| number + 1 }
# end
# p num.select { |number| number >= 3 }
# p num.detect { |number| number > 3 }

# num = num.collect.with_index do |number, index|
  # number = index
# end
# p num

# text = "A regular expression is a sequence of characters that define a search pattern."
# p text.scan(/\b[aeiou][a-z]*\b/)

# 10.times do |i|
#   next unless i.even?
#   puts "hello #{i}"

# puts Math.log10(number).to_i + 1

# require 'date'
# date = DateTime.now
# puts date
# cdt = date.strftime "%d/%m/%Y"
# puts cdt
#
#
# require 'date'
# begin
#    Date.parse("31-02-2010")
# rescue ArgumentError
#    puts "handle invalid date"
# end
# require 'openssl'
#
# def encrypt_string(str)
#   cipher_salt1 = 'some-random-salt-'
#   cipher_salt2 = 'another-random-salt-'
#   cipher = OpenSSL::Cipher.new('AES-128-ECB').encrypt
#   cipher.key = OpenSSL::PKCS5.pbkdf2_hmac_sha1(cipher_salt1, cipher_salt2, 20_000, cipher.key_len)
#   encrypted = cipher.update(str) + cipher.final
#   encrypted.unpack('H*')[0].upcase
# end
#
# def decrypt_string(encrypted_str)
#   cipher_salt1 = 'some-random-salt-'
#   cipher_salt2 = 'another-random-salt-'
#   cipher = OpenSSL::Cipher.new('AES-128-ECB').decrypt
#   cipher.key = OpenSSL::PKCS5.pbkdf2_hmac_sha1(cipher_salt1, cipher_salt2, 20_000, cipher.key_len)
#   decrypted = [encrypted_str].pack('H*').unpack('C*').pack('c*')
#
#   cipher.update(decrypted) + cipher.final
# end
#
# p enc = encrypt_string('[10, 10, 10, 10]') #=> "8F22010F2ABEC116345274374C444F502530D37ABA018CA7F49EC6CA1053FBD7"
# p dec = decrypt_string(enc) #=>

# class Actor
#   def act
#     begin_time = Time.now
#     yield if block_given?
#     end_time = Time.now
#     time_taken = end_time - begin_time
#     return time_taken
#   end
# end
#
# snowy = Actor.new
# time_taken = snowy.act do
#   sleep 0.1
# end
# puts "#{time_taken}"
puts "Enter a topic to search :"
topic = gets.chomp

# system("google-chrome www.google.com/search?q=\"#{topic}\"")
