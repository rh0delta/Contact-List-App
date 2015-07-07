require_relative 'contact_database'

class Contact
 
  attr_accessor :name, :email

  def initialize(name, email)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email
  end

  def to_s
    # TODO: return string representation of Contact
  end
 
  ## Class Methods
  class << self
    def create(name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      ContactDatabase.add(Contact.new(name, email))
    end
 
    def find(term)
      # TODO: Will find and return contacts that contain the term in the first name, last name or email
      # arr = ContactDatabase.read
      # arr.each do |item|
      #   if item.include? term
      #     pp item.to_s
      #   end
      # end
    end

    def all
      # TODO: Return the list of contacts, as is
      arr = ContactDatabase.read
      arr.each do |item| 
        puts "#{item[0]}: #{item[1]} (#{item[2]})"
      end
    end
    
    def show(id)
      # TODO: Show a contact, based on ID
      arr = ContactDatabase.read
      arr.each do |item|
        if item[0] == id.to_s
          puts "#{item[0]}: #{item[1]} (#{item[2]})"
        end
      end
    end
    
  end

  
 
end