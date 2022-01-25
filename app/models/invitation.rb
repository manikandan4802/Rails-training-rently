class Invitation < ApplicationRecord
  belongs_to :agent
  belongs_to :property
  belongs_to :lock_code

  after_create :send_email

  def send_email
    invitation=Invitation.last
    mail=InviteMailer.invite_customer(invitation).deliver_now
    puts(" Success ful **************************************************************")
  end
  def to_s
    self.id
  end
end
