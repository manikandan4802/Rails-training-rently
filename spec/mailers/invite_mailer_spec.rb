require "rails_helper"

RSpec.describe InviteMailer, type: :mailer do
  describe "invite_customer" do
    let(:mail) { InviteMailer.invite_customer }

    it "renders the headers" do
      expect(mail.subject).to eq("Invite customer")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
