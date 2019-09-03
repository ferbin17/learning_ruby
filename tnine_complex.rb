class Tnine

  def initialize
    @key_hash = { '2' => ['a', 'b', 'c'],
                  '3' => ['d', 'e', 'f'],
                  '4' => ['g', 'h', 'i'],
                  '5' => ['j', 'k', 'l'],
                  '6' => ['m', 'n', 'o'],
                  '7' => ['p', 'q','r','s'],
                  '8' => ['t','u','v'],
                  '9' => ['w', 'x', 'y', 'z'],
                  '0' => [' ']
                }
    @options = { printSpace: true, printCharacter: false }
  end

  # frozen_string_literal: true
  def parse_arg_and_print_output(input_argument)
    # Extract Message
    message = extract_message(input_argument)

    # Extract Options
    options = extract_options(input_argument)

    # Conversion and Printing
    convert_and_print(message, options)
  end

  private
  #Extract the message from commandline arguments
  def extract_message(input_argument)
    # downcase the message for comparison
    if input_argument[0][0].to_s.start_with? '-'
      puts 'String Not Found'
      ''
    else
      input_argument[0].downcase
    end
  end

  # Extract the options from commandline arguments
  def extract_options(input_argument)

    argument_length = input_argument.length
    i = 1
    while i < argument_length

      option = input_argument[i]
      option_split = input_argument[i].split('')[2]

      # Look arguments for -s option and -s values
      @options[:printSpace] = !(option_split == '1') if option.include? 's'

      # Look arguments for -p option and -p values
      @options[:printCharacter] = (option_split == '1') if option.include? 'p'
      i += 1
    end
    @options
  end

  def convert_and_print(message, options = {})
    characters = message.downcase.chars
    characters.each_with_index do |valueA, index|
      print_this = ""
      @key_hash.each do |key, valueB|
        print_character = " - #{characters[index]}" if @options[:printCharacter]
        if @options[:printSpace]
          print_this = (key * ((valueB.find_index valueA) + 1)) + print_character.to_s if ((valueB.include? valueA) || valueB == nil)
        else
          print_this = (key * ((valueB.find_index valueA) + 1)) + print_character.to_s if ((valueB.include? valueA) && valueA != ' ')# || @key_Hash[character] != nil
        end
      end
      puts print_this
    end
  end

end

if !ARGV.empty?
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  Tnine.new.parse_arg_and_print_output(ARGV)
  ending_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  elapsed = ending_time - start_time
  puts elapsed
else
  puts 'String Not Found'
end
