class Property < ApplicationRecord
  belongs_to :agent
  has_one :smart_lock, dependent: :destroy
  has_many :lock_codes, dependent: :destroy
  has_many :invitations, dependent: :destroy


after_create :add_smartlock
 
  def add_smartlock
    smartlock = SmartLock.create(property_id:self.id, company_id: self.agent.company_id)
    sm_id = SmartLock.last.id
    for i in 0..9 do
        newcode= rand(10 ** 6)
        lc = LockCode.create(property_id: self.id, smart_lock_id: sm_id, code: newcode)
       # debugger
       
     #  Lockcode.create!(:lockcode=>newcode,:smartlock_id=>@smartlock.id)
    end
  end
end