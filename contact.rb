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
      arr = ContactDatabase.read
      arr.each do |item|
        if item.include? term
          contact_array_to_s(item)
        end
      end
    end

    def all
      # TODO: Return the list of contacts, as is
      arr = ContactDatabase.read
      arr.each do |item| 
        contact_array_to_s(item)
      end
    end
    
    def show(id)
      # TODO: Show a contact, based on ID
      arr = ContactDatabase.read
      arr.each do |item|
        if item[0] == id.to_s
          contact_array_to_s(item)
        end
      end
    end

    private

    def contact_array_to_s(contact_array)
      puts "#{contact_array[0]}: #{contact_array[1]} (#{contact_array[2]})"
    end
    
  end

  
 
end