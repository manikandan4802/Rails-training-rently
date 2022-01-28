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
    company_id {nil}
    email {"mani@rently.com"}
    password {"123123"}    
  end

  factory :property do
    property_type {"rental"}
    bhk {3} 
    size {1000}
    price {350000} 
    address {'Erode'} 
    agent_id {nil} 
  end

  factory :smart_lock do 
      company_id {nil}
      property_id {nil}
      serial_number {nil}
  end

  factory :lock_code do
    code {789879}
    invitation {'true'}
    property_id {nil}
    smart_lock_id {nil}
  end

  factory :access_token, class: "Doorkeeper::AccessToken" do
    application
    expires_in { 2.hours }
    scopes { "public" }
  end

  factory :application, class: "Doorkeeper::Application" do
    sequence(:name) { |n| "Project #{n}" }
    sequence(:redirect_uri)  { |n| "https://example#{n}.com" }
  end

end
  