class Company < ApplicationRecord
    has_many :properties
    has_many :agents
end
