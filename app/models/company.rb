class Company < ApplicationRecord
    has_many :properties
    has_many :agents
    has_many :smart_locks
    after_create :add_smart_locks
  
    def to_s
        self.company_name
    end

    def add_smart_locks
      # debugger
      for i in 0..9 do
        # debugger
        # debugger
        x=SmartLock.where(company_id:nil).first
        # debugger
        x.update(company_id: self.id)
        puts("Updated Smart Lock company id, #{i}")
      end
    end
  end
      # def add_smart_locks
      #       for i in 0..9 do
      #         lc = SmartLock.create(property_id: , smart_lock_id: self.id, code: newcode)
      #        # debugger
             
      #      #  Lockcode.create!(:lockcode=>newcode,:smartlock_id=>@smartlock.id)
      #        end
      #     end
      
      #   end
      # end


      
      # def add_smart_locks
      #   for i in 0..9 do
      #     sl=SmartLock.where(company_id: 1).first
      #     # debugger
      #   sl.update(company_id: self.id)
        
      #   end
      # end
      #   # sm_id = SmartLock.last.id
        
      #       smartlock = SmartLock.create(property_id:self.id, company_id: self.agent.company_id)
      #       newcode= rand(10 ** 6)
      #       lc = LockCode.create(property_id: self.id, smart_lock_id: sm_id, code: newcode)
      #      # debugger
           
      #    #  Lockcode.create!(:lockcode=>newcode,:smartlock_id=>@smartlock.id)
      #   end
      # end

