require 'date'
class Person
# Instance Variables contained within constructor
  def initialize(first_name,surname,dob)
    @first_name=first_name.capitalize
    @surname=surname.capitalize
    @dob= Date.parse(dob)
    @fullname="#{@first_name} #{@surname}"
    @emails,@phone_numbers=[],[]
    @n = nil
  end
  attr_reader :first_name, :surname, :dob, :fullname

  #setter method for email
  def add_email(email)
    @emails << email
  end

  #getter method for email
  def emails()
    @emails
  end

  # #setter method for phone
  def add_phone(phone)
    @phone_numbers << phone
  end
  #
  # #getter method for phone
  def phone_numbers()
    @phone_numbers
  end

  #remove method deletes the first entry of the email addresses array
  def remove_email n
    @n=n
    @n != nil ? @emails.delete_at(@n) : "You have not entered an integer!"
  end

  #remove method deletes the first entry of the email addresses array
  def remove_phone n
    @n=n
    @n != nil ? @phone_numbers.delete_at(@n) : "You have not entered an integer!"
  end

end

class FamilyMember < Person
  def initialize(first_name,surname,dob,relationship)
     super(first_name,surname,dob)
  end
end

class AddressBook
  def initialize()
    @lists=[]
  end

  #setter method for Person instance
  def add_person person
    person.is_a?(Person || FamilyMember) ? @lists.push(person.fullname) : error
  end

  def error
    puts "Error!\nYou've not passed a Person nor FamilyMember object."
  end

  def list
    @lists
  end
end
