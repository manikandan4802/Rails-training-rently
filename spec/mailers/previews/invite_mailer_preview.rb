# Preview all emails at http://localhost:3000/rails/mailers/invite_mailer
class InviteMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/invite_mailer/invite_customer
  def invite_customer
    invitation=Invitation.last
    InviteMailer.invite_customer(invitation)
  end

end
