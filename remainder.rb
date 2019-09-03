class Remainder
  require 'date'
  require "time"

  def inputs_and_call
    loop do
      print "Choose any option to continue\n1.Create\n2.View\n3.Edit\n4.Delete\nPress anyother key to exit\n"
      option = gets.chomp
      system("clear")
      case option
      when "1"

        print "Enter the Remainder Note : "
        remainder_note = gets.chomp

        print "Enter the date for Remainder (DD-MM-YYYY): "
        remainder_date = gets.chomp

        loop do
          break if check_date(remainder_date) != false
          print "Please enter the date for Remainder in correct format (DD-MM-YYYY): "
          remainder_date = gets.chomp
        end

        print "Enter the time for Remainder (HH:MM:XM) : "
        remainder_time = gets.chomp.upcase

        loop do
          break if check_time(remainder_time) != false
          print "Please enter the time for Remainder in correct format (HH:MM:XM) : "
          remainder_time = gets.chomp.upcase
        end

        print "Enter your name : "
        setter_name = gets.chomp

        create_remainder(remainder_note, remainder_date, remainder_time, setter_name, "remainders.txt")

      when "2"
        view_remainder
      when "3"
        edit_remainder
      when "4"
        delete_remainder()
      else
        puts "Wrong input"
        exit
      end
      print "Do you wanna continue (Y/N) : "
      response = gets.chomp
      exit if response.downcase != "y"
    end
  end

  def create_remainder(remainder_note, remainder_date, remainder_time, setter_name, filename)

    remainder_date = Date.strptime(remainder_date, "%d-%m-%Y")
    remainder_time = Time.strptime(remainder_time, "%I:%M:%P")
    current_time = Time.now.strftime("%H:%M:%P")

    line_count = 0;

    file = File.open(filename)
    file.each do |line|
      line_count += 1
    end
    file.close

    file = File.open(filename, "a")
    if line_count > 0
      serial_no = line_count
      string = "|\t#{serial_no}\t|\t#{remainder_date}\t|\t#{remainder_time}\t|\t#{remainder_note}\t|\t#{setter_name}\t|\t#{current_time}\t|\n"
      file.write(string)
    else
      serial_no = 1
      string = "|\tSl. No.\t|\tRemainder Date\t|\tRemainder Time\t|\tRemainder Note\t|\tRemainder Set By\t|\tRemainder Set at\t|\n" +
      string = "|\t#{serial_no}\t|\t#{remainder_date}\t|\t#{remainder_time}\t|\t#{remainder_note}\t|\t#{setter_name}\t|\t#{current_time}\t|\n"
      file.write(string)
    end
    file.close

  end

  def view_remainder

    file = File.open("remainders.txt", "r")
    puts file.read
    file.close

  end

  def edit_remainder

    view_remainder

    print "Choose a serial no to edit"
    serial_no = gets.chomp

    string = ""
    fileA = File.open("remainders.txt")
    fileB = File.open("output.txt","a")
    fileA.each do |line|
      string = line.gsub(/\d/,)
      break if line.match(/^\|\t#{serial_no}\t\|/)
      fileB.write(string)
    end
    fileB.close
    fileA.close

    remainder = string.split("\t|\t")

    loop do
      print "Choose Column to be Edited :\n1.Date\n2.Time\n3.Remainder Note\n4.Name\nExit : "
      response = gets.chomp
      case response

      when "1"
        print "Enter the new Remainder Date : "
        remainder[1] = gets.chomp

        loop do
          break if check_date(remainder_date) != false
          print "Please enter the date for Remainder in correct format (DD-MM-YYYY): "
          remainder[1] = gets.chomp
        end

      when "2"
        print "Enter the new Remainder Time : "
        remainder[2] = gets.chomp

        loop do
          break if check_time(remainder_time) != false
          print "Please enter the time for Remainder in correct format (HH:MM:XM) : "
          remainder_time = gets.chomp.upcase
        end

      when "3"
        print "Enter the new Remainder Note : "
        remainder[3] = gets.chomp

      when "4"
        print "Enter the new Name : "
        remainder[4] = gets.chomp

      else
        exit

      end

      create_remainder(remainder[3], remainder[1], remainder[2], remainder[4], "output.txt")

      print "Do you wanna continue (Y/N)? : "
      response = gets.chomp
      exit if response.upcase != "y"
    end

  end

  def delete_remainder

    view_remainder

    print "Choose a serial no to delete"
    serial_no = gets.chomp

    string = ""
    fileA = File.open("remainders.txt")
    fileB = File.open("output.txt","a")
    fileA.each do |line|
      string = line
      next if line.match(/^\|\t#{serial_no}\t\|/)
      fileB.write(string)
    end
    fileB.close
    fileA.close

    system("rm -f remainder.txt")
    File.rename("output.txt","remainders.txt")

  end

  def check_date(string)
    return false if string.match(/^([0-2][0-9]|3[0,1])-(0[0-9]|1[0-2])-([0-9]){4}$/) == nil
  end

  def check_time(string)
    return false if string.match(/^(1[0-2]|0[0-9]):([0-5][0-9]):([PpAa][Mm])$/) == nil
  end

end

Remainder.new.inputs_and_call
