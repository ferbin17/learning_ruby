class Atm

  def initialize
    @denominations = [2000, 500, 200, 100]
    @avail_denom_count = [10, 10, 10, 10]
    @avail_amount = 0
    @giving_count = [0, 0, 0, 0]
  end

  def entry
    print "Enter the amount you wish to withdraw : "
    withdraw_amount = gets.chomp.to_i
    withdrawal_procedure(withdraw_amount)
    display(withdraw_amount)
  end

  def check_atm_balance
    i = 0;
    while i < @denominations.length
      @avail_amount += @denominations[i] * @avail_denom_count[i]
      i += 1
    end
    @avail_amount
  end

  def withdrawal_procedure(withdraw_amount)

    if check_atm_balance < withdraw_amount
      puts "Insufficient ATM Balance"
    else
      i = 0;
      while i < @denominations.length
        if @avail_denom_count[i] > 0
          note_count = withdraw_amount / @denominations[i]
          @giving_count[i] = note_count < @avail_denom_count[i] ? note_count : @avail_denom_count[i]
          @avail_denom_count[i] = note_count < @avail_denom_count[i] ? @avail_denom_count[i] - note_count : 0
          @avail_amount -= @denominations[i] * @giving_count[i]
          withdraw_amount -= @denominations[i] * @giving_count[i]
        end
        i += 1
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

end

Atm.new.entry
