require 'spec_helper'
describe "AddressBook class - entry in phonebook" do
  it "should store and return personal information" do
    contacts = AddressBook.new
    person1 = Person.new("joe", "bloggs", "1 Jan 1990")
    person2 = Person.new("andy", "nother", "2 Jan 1995")

    # Expected Outcomes
    # expect(contacts.add).to eq "1994-02-02"
    # expect(contacts.add).to eq

    expect(contacts.list).to eq []

    contacts.add_person person1
    contacts.add_person person2
    expect(contacts.list).to eq ["Joe Bloggs", "Andy Nother"]


  end
end
