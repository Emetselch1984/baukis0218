require 'rails_helper'

RSpec.describe StaffMember, type: :model do
  describe "#password=" do
    it "文字列を与えるとパスワードの長さは60の文字列になる"do
      member = StaffMember.new
      member.password = "baukis"
      expect(member.hashed_password).to be_kind_of(String)
      expect(member.hashed_password.size).to eq 60
    end
    it "nilを与えるとhashed_passwordはnilになる" do
      member = StaffMember.new(hashed_password: "x")
      member.password = nil
      expect(member.hashed_password).to be_nil
    end
  end
end
