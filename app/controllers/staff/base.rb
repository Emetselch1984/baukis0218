class Staff::Base < ApplicationController
  private def current_staff_member
    if session[:staff_member_id]
      @current_staff_member ||=
          StaffMember.find_by(id: session[:staff_member_id])
    end
  end

  helper_method :current_staff_member
  def staff_member_params
    params.require(:staff_member).permit(:family_name,:given_name,:family_name_kana,:given_name_kana,
                                         :hashed_password,:start_date,:end_date,:suspended,:created_at,:updated_at)
  end
end