class Admin::StaffMembersController < Admin::Base
  def index
    @staff_members = StaffMember.order(:family_name_kana,:given_name_kana)
  end
  def show
    staff_member = StaffMember.find(params[:id])
    redirect_to [:edit, :admin,staff_member]
  end
  def new
    @staff_member = StaffMember.new
  end
  def create
    @staff_member = StaffMember.new(staff_member_params)
    if @staff_member.save
      flash.notice = "職員アカントを新規登録しました"
      redirect_to :admin_staff_members
    else
      render :new
    end
  end
  def update
    @staff_member = StaffMember.find(params[:id])

  end
  private
  def staff_member_params
    params.require(:staff_member).permit(:family_name,:given_name,:family_name_kana,:given_name_kana,:email,
                                         :hashed_password,:start_date,:end_date,:suspended,:created_at,:updated_at)
  end
end
