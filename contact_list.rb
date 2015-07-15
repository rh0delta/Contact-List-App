require 'active_record'
require 'pg'
require 'table_print'
require 'awesome_print'
require_relative 'contact'
require_relative 'phone'

# TODO: Implement command line interaction
# This should be the only file where you use puts and gets
# ARGV

puts 'Establishing connection to database ...'
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'contact',
  username: 'development',
  password: 'develeopment',
  host: 'localhost',
  port: 5432,
  pool: 5,
  encoding: 'unicode',
  min_messages: 'error'
)
puts 'CONNECTED'

if ARGV[0] == "help"
  puts "Here is a list of available commands:
    new          - Create a new contact
    new phone    - Add a new phone number to a contact
    list         - List all contacts
    show         - Show a contact
    find         - Find a contact"
elsif ARGV[0] == "new"
  
  # puts contact.id
  if ARGV[1] == "phone"
    puts "Enter the type of number you wish to add:"
    cell_type = STDIN.gets.chomp
    puts "Enter the number (XXXXXXXXXX):"
    number = STDIN.gets.chomp
    phone = Phone.create({:cell_type => cell_type, :number => number, :contact_id => ARGV[2]})
    puts phone.id
  else
    puts "Enter your first name: "
    fname = STDIN.gets.chomp
    puts "Enter your last name: "
    lname = STDIN.gets.chomp
    puts "Enter #{fname}'s email address: "
    eml = STDIN.gets.chomp
    contact = Contact.create({'firstname' => fname, 'lastname' => lname, 'email' => eml})
    puts contact.id
  end
elsif ARGV[0].include? "find"
  tp Contact.search(ARGV[1])
elsif ARGV[0].include? "list"
  tp Contact.all, "firstname", "lastname", "email", {"phones.cell_type" => {:display_name => 'Phone Type'}}, {"phones.number" => {:display_name => 'Number'}}
elsif ARGV[0].include? "show"
  tp Contact.find(ARGV[1].to_i)

end

