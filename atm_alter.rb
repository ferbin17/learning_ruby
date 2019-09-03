class Atm

  require 'openssl'

  def initialize
    @denominations = [2000, 500, 200, 100]
    file = File.open("atm_data.txt","r")
    file.each do |line|
      @avail_denom_count = line.chomp.gsub("[","").gsub("]","").split(", ")
    end
    file.close
    @avail_denom_count.each_with_index do |elements,index|
      @avail_denom_count[index] =  elements.to_i
    end
    @avail_amount
    @giving_count
    @flag = 0
  end

  def entry
    print "Enter the amount you wish to withdraw : "
    withdraw_amount = gets.chomp.to_i
    if withdraw_amount > 0
      withdrawal_procedure(withdraw_amount,1)
    else
      puts "Enter a amount greater than 0"
    end
  end

  def check_atm_balance
    @avail_amount = 0
    i = 0;
    while i < @denominations.length
      @avail_amount += @denominations[i] * @avail_denom_count[i]
      i += 1
    end
  end

  def withdrawal_procedure(withdraw_amount,form)

    check_atm_balance

    @giving_count = [0, 0, 0, 0]

    temp = { giving_count: @giving_count.clone, avail_denom_count: @avail_denom_count.clone, avail_amount: @avail_amount.clone }
    @flag += 1
    hash = { amount: withdraw_amount }

    if @avail_amount < hash[:amount]
      puts "Insufficient ATM Balance"
    else
      hash[:amount] -= form
      i = 0;
      while i < @denominations.length
        hash = count_calculation(i,hash[:amount],form,temp)
        i += 1
      end
      if hash[:amount] == 0
        @giving_count = hash.dig :temp_values, :giving_count
        @avail_denom_count = hash.dig :temp_values, :avail_denom_count
        @avail_amount  = hash.dig :temp_values, :avail_amount
        display(withdraw_amount)
        file = File.open("atm_data.txt","w")
        file.write(@avail_denom_count)
        file.close
      elsif @flag != 2
        withdrawal_procedure(withdraw_amount,0)
      else
        puts "denominations not available"
      end
    end

  end

  def display(withdraw_amount)
    puts "For Rs. #{withdraw_amount}"
    i = 0;
    while i < @denominations.length
      puts "#{@denominations[i]} : #{@giving_count[i]}"
      i += 1
    end
  end

  def count_calculation(input,amount,form,temp={})
    if @avail_denom_count[input] > 0

      note_count = amount / @denominations[input]
      temp[:giving_count][input] = note_count < @avail_denom_count[input] ? note_count : @avail_denom_count[input]
      temp[:avail_denom_count][input] = note_count >= @avail_denom_count[input] ? 0 : @avail_denom_count[input] - note_count
      temp[:avail_amount] -= @denominations[input] * temp[:giving_count][input]
      amount -= @denominations[input] * temp[:giving_count][input]
      if @denominations[input] == @denominations[@denominations.length - 2]
        amount += form
      end
    end
    hash = { amount: amount, temp_values: temp}
    return hash
  end

end

Atm.new.entry
