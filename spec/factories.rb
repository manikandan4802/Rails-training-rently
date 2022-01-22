# require 'rails_helper'
FactoryBot.define do
    factory :property do
      property_type {"Rental House"}
      bhk {3}
      size {1000}
      price {120830}
      address {'Erode'}
      agent_id {" "}
    end
  end
  