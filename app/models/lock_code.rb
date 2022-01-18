class LockCode < ApplicationRecord
  belongs_to :property
  belongs_to :smart_lock

  def to_s
    self.code
    self.id
  end
end
