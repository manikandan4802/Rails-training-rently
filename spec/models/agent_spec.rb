require 'rails_helper'

RSpec.describe Agent, type: :model do
  dummy_pwd = 'password'
  dummy_email = 'mani@example.com'
  
  before do
    for i in 0..9 do
      FactoryBot.create(:smart_lock)
      # debugger
    end

    @company=FactoryBot.create(:company)
  end

  context "Agent Validations" do
    it " has been created and Email Validated" do
      @agent = FactoryBot.build(:agent,company_id:@company.id)
      expect(@agent).to be_valid
    end 

    it "has a email" do
      @agent = FactoryBot.build(:agent,company_id:@company.id,email: nil)    
      expect(@agent).to_not be_valid
    end

    it "has valid email format" do
      @agent = FactoryBot.build(:agent,company_id:@company.id,email:"admin..")
      expect(@agent).to_not be_valid
    end

    it "has valid email format" do
      @agent = FactoryBot.build(:agent,company_id:@company.id,email:"admin@mani.com")
      # debugger
      expect(@agent).to be_valid
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
      expect(@agent).to_not be_valid
    end
  end
  # context "Callbacks" do  
  #   it { is_expected.to callback(:add_smart_locks).after(:create) } 
  # end
end