require 'date'
require 'yaml'
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

  def load_yaml
    a_book = YAML.load_file "somebody.yml"
    first_name = a_book['users']['person2']['first_name']
    surname = a_book['users']['person2']['surname']
    dob =a_book['users']['person2']['dob']
    email1 = a_book['users']['person2']['emails'][0]
    email2 = a_book['users']['person2']['emails'][1]
    phone_number1 = a_book['users']['person2']['phone'][0]
    phone_number2 = a_book['users']['person2']['phone'][1]

    person = Person.new(first_name,surname,dob)
    person.add_email email1
    person.add_email email2
    person.add_phone phone_number1
    person.add_phone phone_number2

    @lists << person
    puts first_name, surname, dob, email1, email2, phone_number1, phone_number2
  end

  #setter method for Person instance
  # def add_person person
  #   person.is_a?(Person || FamilyMember) ? @lists.push(person.fullname) : error
  # end

  #setter method for Person instance
  def add_person person
    person.is_a?(FamilyMember) || person.is_a?(Person) ? (@lists.push(person.fullname)) : error
  end

  def error
    puts "Error!\nYou've not passed a Person nor FamilyMember object."
  end

  def list
      @lists
    
  end
end
