class InviteMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invite_mailer.invite_created.subject
  #
 
  def invite_created
    @agent=params[:agent]
    @invitation=params[:invitation]
    @greeting = "Hi"
    attachments['rently.png'] = File.read('app/assets/images/rently.png')
    mail( 
    from:"manikandan.k@rently.com",
    to: "to@example.org", 
    subject: "Invite created"
    )
  end
end
