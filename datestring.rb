class DateString
  require 'date'
  def caller
    date = DateTime.now
    day = date.strftime("%d")
    month = date.strftime("%m")
    year = date.strftime("%Y")
    print day_String(day)
    month_String(month)
    year_String(year)
  end
  def day_String(day)
    date_Hash = { "1" => "first", "2" => "second", "3" => "third", "4" => "four",
                   "5" => "fif", "6" => "six", "7" => "seven", "8" => "eight",
                   "9" => "nine", "10" => "ten", "11" => "eleven",
                   "12" => "twelve", "13" => "thirteen", "15" => "fifteen",
                   "20" => "twenty", "30" => "thirty", "40" => "fourty",
                   "50" => "fifty", "60" => "sixty", "70" => "seventy",
                   "80" => "eighty", "90" => "ninety"}
    day = day[1] if day[0] == "0"
    if date_Hash[day] != nil
      print_this = "#{date_Hash[day]}th\t"
    else
      count = day.to_i/10.0
      case count
      when (1.0..1.9)
        print_this = "#{date_Hash[day[1]]}" + "teen th\t"
      when (2.0..2.9)
        print_this =  "#{date_Hash["20"]}" + "#{date_Hash[day[1]]} th\t"
      when (3.0..3.1)
        print_this = "#{date_Hash["30"]}" + "#{date_Hash[day[1]]} th\t"
      else
        temp_Digit = (day.to_i % 10).to_s
        temp_Day = ((day.to_i / 10) * 10).to_s
        print_this = "#{date_Hash[temp_Day]}" + "#{date_Hash[temp_Digit]} th\t"
      end
    end
    return print_this
  end
  def month_String(month)
    month_Hash = { "1" => "January", "2" => "February",  "3" => "March",
                   "4" => "April",  "5" => "May",  "6" => "June",
                   "7" => "July",  "8" => "August",  "9" => "September",
                   "10" => "October",  "11" => "November",  "12" => "December" }
    month = month[1] if month[0] == "0"
    print "#{month_Hash [month]}\t"
  end
  def year_String(year)
    digit_Hash = { "1" => "one", "2" => "two", "3" => "three", "4" => "four",
                   "5" => "five", "6" => "six", "7" => "seven", "8" => "eight",
                   "9" => "nine", "10" => "ten", "0" => "" }
    year_End = (year.to_i%100)
    year_End = day_String(year_End.to_s).split(" ")[0]
    if year[1] != "0"
      puts "#{digit_Hash[year[0]]} thousand #{digit_Hash[year[1]]} hundred #{year_End}"
    else
      puts "#{digit_Hash[year[0]]} thousand #{digit_Hash[year[1]]} #{year_End}"
    end
  end
end
DateString.new.caller
