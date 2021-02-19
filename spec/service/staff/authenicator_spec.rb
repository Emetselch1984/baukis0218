require "rails_helper"

describe Staff::Authenticator do
  describe "authenicate" do
    let(:m) { build(:staff_member)}
    let(:password){"pw"}
    subject{Staff::Authenticator.new(m).authenticate(password)}
    it "正しいパスワードならtrueを返す" do
      is_expected.to be_truthy
    end
    it "誤ったパスワードならfalseを返す" do
      expect(Staff::Authenticator.new(m).authenticate("xx")).to be_falsey
    end
    it "パスワードが未設定ならfalseを返す" do
      m = build(:staff_member,password: nil)
      expect(Staff::Authenticator.new(m).authenticate(nil)).to be_falsey
    end
    it "停止フラグが立っていてもtrueを返す" do
      m = build(:staff_member,suspended: true)
      expect(Staff::Authenticator.new(m).authenticate("pw")).to be_truthy
    end
    it "開始前ならfalseを返す" do
      m = build(:staff_member,start_date: Date.tomorrow)
      expect(Staff::Authenticator.new(m).authenticate("pw")).to be_falsey
    end
    it "終了後ならfalseを返す" do
      m = build(:staff_member,end_date: Date.today)
      expect(Staff::Authenticator.new(m).authenticate("pw")).to be_falsey
    end
  end
end