# require 'rails_helper'
FactoryBot.define do

  factory :company do
    company_name {"Rently"}
    admin_name {"bakersfield"}
    phone_number {9832093575}
  end
  factory :agent do
    agent_name {"Guru"}
    company_name {"Rently"}
    role {'admin'}
    phone_number {9952485524}
    company_id {" "}
    email {"mani@rensdtly.com"}
    password {"123123"}    
  end

  factory :property do
    property_type {"rental"}
    bhk {3} 
    size {1000}
    price {350000} 
    address {'Erode'} 
    agent_id {' '} 
    # company_id {' '} 
  end

  factory :smart_lock do 
      company_id {' '}
      property_id {' '}
      assigned {'false'}
  end

  factory :lock_code do
    invitation {'true'}
    property_id {' '}
    smart_lock_id {' '}
  end
end
  