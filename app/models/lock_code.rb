class LockCode < ApplicationRecord
  belongs_to :property
  belongs_to :smart_lock
end
