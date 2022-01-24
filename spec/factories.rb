# require 'rails_helper'
FactoryBot.define do

  factory :company do
    company_name {"Rently"}
    admin_name {"bakersfield"}
    phone_number {9832093575}
    flag {0}
  end
  factory :agent do
    agent_name {"Guru"}
    company_name {"Rently"}
    role {"Admin"}
    phone_number {9952485524}
    company_id {" "}
    email {"admin@example.com"}
    password {"123123"}    
  end
end
  