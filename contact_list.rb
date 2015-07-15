require_relative 'contact'
require_relative 'phone'
require 'table_print'
require 'byebug'

# TODO: Implement command line interaction
# This should be the only file where you use puts and gets
# ARGV


if ARGV[0].downcase == "help"
  puts "Here is a list of available commands:
    new          - Create a new contact
    new phone    - Add a new phone number to a contact
    list         - List all contacts
    list numbers - List all phone numebrs in your list 
    show         - Show a contact
    find         - Find a contact"
elsif ARGV[0] == "new"
  
  # puts contact.id
  if ARGV[1].downcase == "phone"
    puts "Enter the type of number you wish to add:"
    type = STDIN.gets.chomp
    puts "Enter the number (XXXXXXXXXX):"
    number = STDIN.gets.chomp
    hash = {'type' => type, 'number' => number, 'contact_id' => ARGV[2]}
    phone = Phone.new(hash)
    phone.save
    puts phone.id
  else
    puts "Enter your first name: "
    fname = STDIN.gets.chomp
    puts "Enter your last name: "
    lname = STDIN.gets.chomp
    puts "Enter #{fname}'s email address: "
    eml = STDIN.gets.chomp
    hash = {'firstname' => fname, 'lastname' => lname, 'email' => eml}
    contact = Contact.new(hash)
    contact.save
  end
elsif ARGV[0].include? "find"
  puts Contact.find(ARGV[1])
elsif ARGV[0].include? "list"
  if ARGV[1] == "numbers"
    # byebug
    tp Phone.all_numbers, :type, :number, :contact_id
  end
  tp Contact.all, :firstname, :lastname, :email
elsif ARGV[0].include? "show"
  puts Contact.show(ARGV[1])

end

