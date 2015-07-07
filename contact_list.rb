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
  puts "Enter the name you wish to add: "
  name = STDIN.gets.chomp
  puts "Enter #{name}'s email address: "
  email = STDIN.gets.chomp
  contact = Contact.new(name, email)
  Contact.create(contact.name, contact.email)
elsif ARGV[0].include? "find"
  Contact.find(ARGV[1])
elsif ARGV[0].include? "list"
  Contact.all
elsif ARGV[0].include? "show"
  Contact.show(ARGV[1])

end


