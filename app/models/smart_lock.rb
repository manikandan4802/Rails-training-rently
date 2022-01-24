class SmartLock < ApplicationRecord
  belongs_to :company
  belongs_to :property
  has_many :lock_codes
  def to_s
    self.id
  end

  before_save :generate_lock_codes
  def generate_lock_codes
    if self.assigned
      for i in 0..9 do
        newcode= rand(10 ** 6)
        lc = LockCode.create(property_id: self.property_id, smart_lock_id: self.id, code: newcode)
       # debugger
       
     #  Lockcode.create!(:lockcode=>newcode,:smartlock_id=>@smartlock.id)
       end
    end

  end

end
