class SmartLock < ApplicationRecord
  belongs_to :company, optional: true
  belongs_to :property,optional: true
  has_many :lock_codes
  def to_s
    self.id
  end

  after_create :assign_serial_number

  sl=[]


  def assign_serial_number
    newcode= rand(10 ** 6)
    if SmartLock.pluck(:serial_number).exclude? newcode  
      update(serial_number: newcode)
    else
        assign_serial_number
    end
  end





  # before_save :generate_lock_codes
  
  # def generate_lock_codes
  #   if self.assigned
  #     for i in 0..9 do
  #       newcode= rand(10 ** 6)
  #       lc = LockCode.create(property_id: self.property_id, smart_lock_id: self.id, code: newcode)
  #      # debugger
       
  #    #  Lockcode.create!(:lockcode=>newcode,:smartlock_id=>@smartlock.id)
  #      end
  #   end

  # end

end
