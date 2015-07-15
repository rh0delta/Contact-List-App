

class Contact < ActiveRecord::Base 
 
  has_many :phones

  def self.search(query)
    self.where(["firstname LIKE ? OR lastname LIKE ? OR email LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%"])
  end
  
 
end