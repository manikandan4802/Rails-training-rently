class SmartLock < ApplicationRecord
  belongs_to :company
  belongs_to :property
  def to_s
    self.id
  end
end
