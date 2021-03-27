class Doctor < ApplicationRecord
  belongs_to :user

  validates(
    :user_id,
    uniqueness: { case_sensitive: false, message: "is already a doctor" }
  )

  def verify!
    self.verified = true
    save
  end
end
