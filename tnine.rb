class Tnine

  def initialize
    @key_hash = { 'a' => '2', 'b' => '22', 'c' => '222',
               'd' => '3', 'e' => '33', 'f' => '333',
               'g' => '4', 'h' => '44', 'i' => '444',
               'j' => '5', 'k' => '55', 'l' => '555',
               'm' => '6', 'n' => '66', 'o' => '666',
               'p' => '7', 'q' => '77', 'r' => '777', 's' => '7777',
               't' => '8', 'u' => '88', 'v' => '888',
               'w' => '9', 'x' => '99', 'y' => '999', 'z' => '9999',
               ' ' => '0' }
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


    character_array = message.chars
    character_array.each do |character|
      print_charatcer = " - #{character}" if @options[:printCharacter]
      if @options[:printSpace]
        print_this = (@key_hash[character]).to_s + print_charatcer.to_s unless @key_hash[character].nil?
      else
        print_this = (@key_hash[character]).to_s + print_charatcer.to_s if @key_hash[character] != '0' # || @key_Hash[character] != nil
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
