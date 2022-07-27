class SubAgentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sub_agent_mailer.sub_agent.subject
  #
  def sub_agent(agent)
    @agent=agent
    attachments.inline["thanks.png"] = File.read("#{Rails.root}/app/assets/images/thanks.png")
    mail to: @agent.email,
    subject: "Password Credentials for your account"
end
  # def sub_agent
  #   @greeting = "Hi"

  #   mail to: "to@example.org"
  # end
end
