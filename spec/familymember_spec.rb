require 'spec_helper'
describe "FamilyMember class - entry in phonebook" do
  it "should store and return personal information" do
    member = FamilyMember.new("timothy", "henry", "2 Feb 1994", "cousin")

    # Expected Outcomes
    expect(member.dob.to_s).to eq "1994-02-02"
    expect(member.first_name).to eq "Timothy"
    expect(member.surname).to eq "Henry"
    expect(member.fullname).to eq "Timothy Henry"

    expect(member.emails).to eq []
    member.add_email "tim@foo.com"
    member.add_email "timHenry@foo.com"
    expect(member.emails).to eq ["tim@foo.com","timHenry@foo.com"]

    expect(member.phone_numbers).to eq []
    member.add_phone "07712345678"
    member.add_phone "02012345678"
    expect(member.phone_numbers).to eq ["07712345678","02012345678"]

    expect(member.remove_email 0).to eq "tim@foo.com"
    expect(member.emails).to eq ["timHenry@foo.com"]
    expect(member.remove_phone 0).to eq "07712345678"


  end
end
