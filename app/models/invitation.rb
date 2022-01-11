class Invitation < ApplicationRecord
  belongs_to :agent
  belongs_to :property
  belongs_to :lock_code
end
