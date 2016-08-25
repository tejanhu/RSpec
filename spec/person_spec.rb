require 'spec_helper'
describe "Person class - entry in phonebook" do
  it "should store and return personal information" do
    person = Person.new("joe", "bloggs", "1 Jan 1996")

    # Expected Outcomes
    expect(person.dob.to_s).to eq "1996-01-01"
    expect(person.first_name).to eq "Joe"
    expect(person.surname).to eq "Bloggs"
    expect(person.fullname).to eq "Joe Bloggs"

    expect(person.emails).to eq []
    person.add_email "joe@foo.com"
    person.add_email "joeBloggs@foo.com"
    expect(person.emails).to eq ["joe@foo.com","joeBloggs@foo.com"]

    expect(person.phone_numbers).to eq []
    person.add_phone "07712345678"
    person.add_phone "02012345678"
    expect(person.phone_numbers).to eq ["07712345678","02012345678"]


    # expect(person.add_email).to eq "joe.bloggs@work.com"
  end
end
