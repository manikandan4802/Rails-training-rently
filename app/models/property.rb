class Property < ApplicationRecord
  belongs_to :agent
  has_one :smart_lock, dependent: :destroy
  has_many :lock_codes, dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_one_attached :image



  
   validates :property_type, :bhk, :price, :size, :address, presence: true
  # validates :name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :size, :bhk, :price, numericality: true 
  # validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  # validates_uniqueness_of :phone_number, :email

# after_create :add_smartlock
def to_s
  self.id
end

  # def add_smartlock
  #   smartlock = SmartLock.create(property_id:self.id, company_id: self.agent.company_id)
  #   sm_id = SmartLock.last.id
  #   for i in 0..9 do
  #       newcode= rand(10 ** 6)
  #       lc = LockCode.create(property_id: self.id, smart_lock_id: sm_id, code: newcode)
  #      # debugger
       
  #    #  Lockcode.create!(:lockcode=>newcode,:smartlock_id=>@smartlock.id)
  #   end
  # end
end