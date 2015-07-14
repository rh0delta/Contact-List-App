require_relative 'contact'
require_relative 'contact_database'

# TODO: Implement command line interaction
# This should be the only file where you use puts and gets
# ARGV


if ARGV[0].downcase == "help"
  puts "Here is a list of available commands:
    new  - Create a new contact
    list - List all contacts
    show - Show a contact
    find - Find a contact"
elsif ARGV[0].include? "new"
  puts "Enter your first name: "
  fname = STDIN.gets.chomp
  puts "Enter your last name: "
  lname = STDIN.gets.chomp
  puts "E
  nter #{fname}'s email address: "
  eml = STDIN.gets.chomp
  hash = {'firstname' => fname, 'lastname' => lname, 'email' => eml}
  contact = Contact.new(hash)
  contact.save
  # puts contact.id
elsif ARGV[0].include? "find"
  puts Contact.find(ARGV[1])
elsif ARGV[0].include? "list"
  puts Contact.all
elsif ARGV[0].include? "show"
  puts Contact.show(ARGV[1])

end

