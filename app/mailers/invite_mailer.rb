class InviteMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invite_mailer.invite_created.subject
  #
  def invite_created
    @greeting = "Hi"

    mail to:"from@example.com", subject: "Invite created"
  end
end
