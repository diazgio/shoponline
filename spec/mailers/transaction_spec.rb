require "rails_helper"

RSpec.describe TransactionMailer, type: :mailer do
  describe "create" do
    let(:mail) { TransactionMailer.create }

    it "renders the headers" do
      expect(mail.subject).to eq("Create")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
