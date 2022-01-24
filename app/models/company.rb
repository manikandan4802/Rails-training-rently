class Company < ApplicationRecord
    has_many :properties
    has_many :agents
    # after_create :add_smartlock
    def to_s
        self.company_name
      end


      # def add_smartlock
      #   # smartlock = SmartLock.create(property_id:self.id, company_id: self.agent.company_id)
      #   # sm_id = SmartLock.last.id
      #   for i in 0..9 do
      #       smartlock = SmartLock.create(property_id:self.id, company_id: self.agent.company_id)
      #       newcode= rand(10 ** 6)
      #       lc = LockCode.create(property_id: self.id, smart_lock_id: sm_id, code: newcode)
      #      # debugger
           
      #    #  Lockcode.create!(:lockcode=>newcode,:smartlock_id=>@smartlock.id)
      #   end
      # end
end
