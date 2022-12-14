require "rails_helper"

RSpec.describe SubAgentMailer, type: :mailer do
  describe "sub_agent" do
    let(:mail) { SubAgentMailer.sub_agent }

    it "renders the headers" do
      expect(mail.subject).to eq("Sub agent")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
