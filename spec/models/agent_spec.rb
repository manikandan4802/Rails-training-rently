require 'rails_helper'

RSpec.describe Agent, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
debugger
  describe Agent do
    #Have a valid factory
    it "has a valid factory" do
      expect(FactoryBot.build(:agent)).to be_valid
    end
  
    it "is invalid without a name" do
    agent = FactoryBot.build(:agent, agent_name: nil)
      agent.valid?
      expect(agent.errors[:agent_name]).to include("can't be blank")
    end

    it "is invalid without a email" do
      agent = FactoryBot.build(:agent, email: nil)
      agent.valid?
      expect(agent.errors[:email]).to include("can't be blank")
    end

  #Must be invalid without password
    it "is invalid without a password" do
      agent = FactoryBot.build(:agent, password: nil)
      agent.valid?
      expect(agent.errors[:password]).to include("can't be blank")
    end

  #If the email address is duplicated, it must be invalid.
    it "is invalid with a duplicate email address" do
      FactoryBot.create(:agent, email: "example@example.com")
      agent = FactoryBot.build(:agent, email: "example@example.com")
      agent.valid?
      expect(agent.errors[:email]).to include("has already been taken")
    end

  end
end
