class InviteMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invite_mailer.invite_customer.subject
  #
  def invite_customer(invitation)
    # @property=propert
    @invitation=invitation

    mail to: @invitation.recipient_email,
    subject: "New lock_code for your property #{@invitation.lock_code.code}"
  end
end
