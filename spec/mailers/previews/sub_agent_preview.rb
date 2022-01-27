# Preview all emails at http://localhost:3000/rails/mailers/sub_agent
class SubAgentPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/sub_agent/sub_agent
  def sub_agent
    agent=Agent.last
    SubAgentMailer.sub_agent(agent)
    # SubAgentMailer.sub_agent
  end

end
