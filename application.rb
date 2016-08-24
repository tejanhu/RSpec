require 'date'
class Person
# Instance Variables contained within constructor
  def initialize(first_name,surname,dob)
    @first_name=first_name.capitalize
    @surname=surname.capitalize
    @dob= Date.parse(dob)
    @fullname="#{@first_name} #{@surname}"
    @emails = []
  end
  attr_reader :first_name, :surname, :dob, :fullname

  #setter method for email
  def add_email(email)
    @emails << email
  end

end
