class Company < ApplicationRecord
    has_many :properties
    has_many :agents
    has_many :smart_locks
    after_create :add_smart_locks
  
    def to_s
        self.company_name
    end

    def add_smart_locks
      # for i in 0..9 do
      #   smart_lock=SmartLock.where(company_id:nil).first
      #   # debugger
      #   smart_lock.update(company_id: self.id)
      # end
      # debugger
      SmartLock.where(company_id:nil).limit(10).update_all(company_id: self.id)
      
    end
  end