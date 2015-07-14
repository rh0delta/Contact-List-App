require_relative 'contact'
require 'pg'

class Phone
  attr_accessor :type, :number, :contact_id
  attr_reader :id


  def initialize(hash)
    @id = hash["id"].to_i if hash["id"]
    @type = hash["type"]
    @number = hash["number"]
    @contact_id = hash["contact_id"]
  end

  def to_s
    str = "Type: #{@type}||Number: #{@number}||Contact ID: #{contact_id}"
  end

  def save
    if id
      sql = 'UPDATE phone SET type=$1, number=$2, contact_id=$3 WHERE id=$4;'
      self.class.connection.exec_params(sql, [type, number, contact_id, @id])
    else
      sql = 'INSERT INTO phone (type, number, contact_id) VALUES ($1,$2,$3) RETURNING id;'
      result = self.class.connection.exec_params(sql, [type, number, contact_id])
      @id = result[0]["id"].to_i
    end
  end

  def self.all_numbers
    self.connection.exec('SELECT * FROM phone;') do |results|
      results.map do |hash|
        Phone.new(hash)
      end
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


