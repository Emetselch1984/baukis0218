class StaffMember < ApplicationRecord
  def password=(raw_password)
    if raw_password.kind_of?(String)
      self.hashed_password = BCrypt::Password.create(raw_password)
    else
      self.hashed_password = nil if raw_password.nil?
    end
  end
end
