class Admin::ProfileController < Admin::Base
  def index
    @staff_members = StaffMember.order(:family_name_kana,:given_name_kana)
  end
end
