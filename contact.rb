require_relative 'contact_database'
require 'pg'

class Contact
 
  attr_accessor :firstname, :lastname, :email
  attr_reader :id

  def initialize(hash)
    @id = hash["id"].to_i if hash["id"]
    @firstname = hash["firstname"]
    @lastname = hash["lastname"]
    @email = hash["email"]

  end

  def to_s
    # TODO: return string representation of Contact
    str = "ID: #{@id}||First Name: #{@firstname}||Last Name: #{@lastname}||Email: #{@email}"
  end
 
  ## Class Methods
  class << self
    def find(term)
      # TODO: Will find and return contacts that contain the term in the first name, last name or email
      self.connection.exec("SELECT * FROM contacts WHERE firstname LIKE '%#{term}%' OR lastname LIKE 
        '%#{term}%' OR email LIKE '%#{term}%';") do |results|
        results.map do |hash|
          Contact.new(hash)
        end
      end
    end


    def all
      self.connection.exec('SELECT * FROM contacts;') do |results|
        results.map do |hash|
          Contact.new(hash)
        end
      end
    end
    
    def show(id)
      # TODO: Show a contact, based on ID
      return self.connection.exec("SELECT * FROM contacts WHERE id = #{id};") do |results|
        results.map do |hash|
          Contact.new(hash)
        end
      end
    end
    
  end



  def save
    if id
      sql = 'UPDATE contacts SET firstname=$1, lastname=$2, email=$3 WHERE id=$4;'
      self.class.connection.exec_params(sql, [firstname, lastname, email, @id])
    else
      sql = 'INSERT INTO contacts (firstname, lastname, email) VALUES ($1,$2,$3) RETURNING id;'
      result = self.class.connection.exec_params(sql, [firstname, lastname, email])
      puts result.inspect
      @id = result[0]["id"].to_i
    end
  end

  def self.connection
    PG.connect(
      host: 'localhost',
      dbname: 'contact',
      user: 'development',
      password: 'develeopment'
    )
  end

  
 
end