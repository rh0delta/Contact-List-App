## TODO: Implement CSV reading/writing
require 'csv'


class ContactDatabase

  def self.add(contact)
    CSV.open('contacts.csv', "ab") do |csv|
      csv << [next_id, contact.name, contact.email]
    end      

  end

  def self.read
    contacts_array = CSV.read('contacts.csv')
  end

  private

  def self.next_id
    contact_array = CSV.read('contacts.csv')
    contact_id = contact_array.length + 1
  end

end