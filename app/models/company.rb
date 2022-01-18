class Company < ApplicationRecord
    has_many :properties
    has_many :agents

    def to_s
        self.company_name
      end
end
