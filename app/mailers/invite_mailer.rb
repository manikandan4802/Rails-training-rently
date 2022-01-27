class InviteMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invite_mailer.invite_customer.subject
  #
  def invite_customer(invitation)
    # @property=propert
    @invitation=invitation
    attachments.inline["thanks.png"] = File.read("#{Rails.root}/app/assets/images/thanks.png")
    mail to: @invitation.recipient_email,
    subject: "Invitation from Rently Smart Home"
  end
end
