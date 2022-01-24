require 'rails_helper'

RSpec.describe Agent, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  
    dummy_pwd = 'password'
    dummy_email = 'mani@example.com'
  before do
    @company=FactoryBot.create(:company)
  end

  it " has been created and Email Validated" do
    result = FactoryBot.create(:agent,company_id:@company.id)
    expect(result).to be_valid
  end 

  context "Agent Validations" do

    it "has a email" do
      @agent = FactoryBot.build(:agent,company_id:@company.id,email: nil)
      
      expect(@agent).to_not be_valid
    end

    it "has valid format" do
      @agent = FactoryBot.build(:agent,company_id:@company.id,email:"admin..")
    expect(@agent).to_not be_valid
   
  end

  it "has password at least 6 characters long" do
    @agent = FactoryBot.build(:agent,company_id:@company.id,password:"pass",password_confirmation:"pass")
    expect(@agent).to_not be_valid
   
  end

 

  it "has a name" do
    @agent = FactoryBot.build(:agent,company_id:@company.id,agent_name:nil)
    expect(@agent).to_not be_valid
  
  end

  it "has a role" do
    @agent = FactoryBot.build(:agent,company_id:@company.id,role:nil)
    # debugger
    expect(@agent).to_not be_valid
   
  end



  end


  
end