require 'rails_helper'

RSpec.describe Property, type: :model do
  # let(:property) { build(:property) }
  
  # before(:all) do
  #   @property1 = create(:property)
  # end
  # debugger
  # it "is valid with valid attributes" do
  #   expect(@property1).to be_valid
  # end
  
  # it "has a unique propertyname" do
  #   property2 = build(:property, property_type: "Rental House", bhk: 3, size: 1000, price: 120830, address: 'Erode')
  #   expect(property2).to_not be_valid
  # end


  before do
    @property=FactoryBot.create(:property)
  end
debugger
  it "Agent has been created and Email Validated" do
    result = FactoryBot.create(:property)
    expect(result).to be_valid
  end 
  
  # it "has a unique email" do
  #   property2 = build(:property, propertyname: "Bob")
  #   expect(property2).to_not be_valid
  # end
  
  # it "is not valid without a password" do 
  #   property2 = build(:property, password: nil)
  #   expect(property2).to_not be_valid
  # end
  
  # it "is not valid without a propertyname" do 
  #   property2 = build(:property, propertyname: nil)
  #   expect(property2).to_not be_valid
  # end
  
  # it "is not valid without an email" do
  #   property2 = build(:property, email: nil)
  #   expect(property2).to_not be_valid
  # end
end