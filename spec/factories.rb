# require 'rails_helper'
FactoryBot.define do

  factory :agent do
    agent_name {"Guru"}
    company_name {"Rently"}
    role {"Admin"}
    phone_number {9952485524}
    company_id {2}
    email {"admin@example.com"}
    password {"123123"}    
  end
end
  