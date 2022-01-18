class Invitation < ApplicationRecord
  belongs_to :agent
  belongs_to :property
  belongs_to :lock_code

  def to_s
    self.id
  end
end
